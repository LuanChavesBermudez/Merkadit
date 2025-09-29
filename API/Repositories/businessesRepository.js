const database = require('../db');

function settleBusiness(data) {
    const instruccion = 'CALL settleBusiness(?, ?)'
    const parametros = [
        data.pBusinessName,
        data.pStoreName
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

module.exports = {
    settleBusiness
};