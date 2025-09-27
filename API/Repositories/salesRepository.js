const database = require('../db');

function registerSale(data) {
    const instruccion = 'CALL registerSale(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    const parametros = [
        data.pProductName,
        data.pStoreName,
        data.pQuantitySold,
        data.pAmountPaid,
        data.pPaymentMethod,
        data.pPostTime,
        data.pRefid,
        data.pInvoiceNumber,
        data.pCustomer,
        data.pDiscounts
    ];

    return new Promise((resolve, reject) => {
        database.query(instruccion, parametros, (error, resultado) => {
            if (error) {
                return reject(error);
            }
            resolve(resultado);
        });
    });
};


function getInvoices(){
    const instruccion = 'SELECT * FROM invoices';

    return new Promise((resolve, reject) => {
        database.query(instruccion, (error, resultado) => {
            if (error) {
                return reject(error);
            }
            resolve(resultado);
        });
    });
};

module.exports = {
    registerSale,
    getInvoices
};