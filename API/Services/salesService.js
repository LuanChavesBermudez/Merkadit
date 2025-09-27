salesRepository = require('../Repositories/salesRepository');

async function registerSaleService(data) {
    return await salesRepository.registerSale(data);
}

async function getInvoicesService() {
    return await salesRepository.getInvoices();
}

module.exports = {
    registerSaleService,
    getInvoicesService
};