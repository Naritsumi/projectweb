/******************************************************************************
 * Basado en el trabajo de Martin Hawksey twitter.com/mhawksey  *
 ******************************************************************************/

// No comentar esta línea, se podría filtrar esta información
var TO_ADDRESS = "haridian.vr@gmail.com";

// spit out all the keys/values from the form in HTML for email
// uses an array of keys if provided or the object to determine field order
function formatMailBody(obj, order) {
  var result = "";
  if (!order) {
    order = Object.keys(obj);
  }
  
  // loop de las "primary keys" para recorrer
  for (var idx in order) {
    var key = order[idx];
    result += "<h4 style='text-transform: capitalize; margin-bottom: 0'>" + key + "</h4><div>" + obj[key] + "</div>";
      //Texto a devolver del mensaje (al google sheets)
  }
  return result; // devuelve el resultado
}

// sanitize content from the user - trust no one 
// ref: https://developers.google.com/apps-script/reference/html/html-output#appendUntrusted(String)
function sanitizeInput(rawInput) {
   var placeholder = HtmlService.createHtmlOutput(" ");
   placeholder.appendUntrusted(rawInput);
  
   return placeholder.getContent();
 }

function doPost(e) {

  try {
    Logger.log(e); // Google Script version of console.log see: Class Logger
    record_data(e);
    
    // donde se almacenan los parametros 
    var mailData = e.parameters;
    var orderParameter = e.parameters.formDataNameOrder;
    var dataOrder;
    if (orderParameter) {
      dataOrder = JSON.parse(orderParameter);
    }
    
    // determine recepient of the email
    // if you have your email uncommented above, it uses that `TO_ADDRESS`
    // otherwise, it defaults to the email provided by the form's data attribute
    var sendEmailTo = (typeof TO_ADDRESS !== "undefined") ? TO_ADDRESS : mailData.formGoogleSendEmail;
    
    // Enviar mensaje
    if (sendEmailTo) {
      MailApp.sendEmail({
        to: String(sendEmailTo),
        subject: "Contact form submitted",
        replyTo: String(mailData.email),
        htmlBody: formatMailBody(mailData, dataOrder)
      });
    }

    return ContentService    // conexión
          .createTextOutput(
            JSON.stringify({"result":"success",
                            "data": JSON.stringify(e.parameters) }))
          .setMimeType(ContentService.MimeType.JSON);
  } catch(error) { // devuelve error si no consigue conectar
    Logger.log(error);
    return ContentService
          .createTextOutput(JSON.stringify({"result":"error", "error": error}))
          .setMimeType(ContentService.MimeType.JSON);
  }
}

/**
 * Aquí es donde graba, y edita
 * 
 */
function record_data(e) {
  var lock = LockService.getDocumentLock();
  lock.waitLock(30000); // espera 3000ms para evitar sobre-escritura, en caso de que algún usuario le de click varias veces al botón
  
  try {
    Logger.log(JSON.stringify(e)); 
    
    // Selecciona la Google sheets indicada por defecto en el script
    var doc = SpreadsheetApp.getActiveSpreadsheet();
    var sheetName = e.parameters.formGoogleSheetName || "responses";
    var sheet = doc.getSheetByName(sheetName);
    
    var oldHeader = sheet.getRange(1, 1, 1, sheet.getLastColumn()).getValues()[0];
    var newHeader = oldHeader.slice();
    var fieldsFromForm = getDataColumns(e.parameters);
    var row = [new Date()]; // El primer elemento de la fila siempre debe ser una timestamp
    
    // recorrer columnas
    for (var i = 1; i < oldHeader.length; i++) { // empieza en el 1 para evitar el timestamp
      var field = oldHeader[i];
      var output = getFieldFromData(field, e.parameters);
      row.push(output);
      
      var formIndex = fieldsFromForm.indexOf(field);
      if (formIndex > -1) {
        fieldsFromForm.splice(formIndex, 1);
      }
    }
    
    //  Para generar nuevas columnas a nuestro Google Sheets
    for (var i = 0; i < fieldsFromForm.length; i++) {
      var field = fieldsFromForm[i];
      var output = getFieldFromData(field, e.parameters);
      row.push(output);
      newHeader.push(field);
    }
    
    var nextRow = sheet.getLastRow() + 1; // Se pasa a la siguiente celda
    sheet.getRange(nextRow, 1, 1, row.length).setValues([row]);

    // Actualiza los datos
    if (newHeader.length > oldHeader.length) {
      sheet.getRange(1, 1, 1, newHeader.length).setValues([newHeader]);
    }
  }
  catch(error) {
    Logger.log(error);
  }
  finally {
    lock.releaseLock();
    return;
  }

}

// Cuando le das a responder mensaje, te devuelve directamente el email recibido por web, no el propio del usuario
function getDataColumns(data) {
  return Object.keys(data).filter(function(column) {
    return !(column === 'formDataNameOrder' || column === 'formGoogleSheetName' || column === 'formGoogleSendEmail' || column === 'honeypot');
  });
}

function getFieldFromData(field, data) {
  var values = data[field] || '';
  var output = values.join ? values.join(', ') : values;
  return output;
}