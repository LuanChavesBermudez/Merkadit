businessesRepository = require('../Repositories/businessesRepository');

async function settleBusiness(data) {
    return await businessesRepository.settleBusiness(data);
}

module.exports = {
    settleBusiness
};