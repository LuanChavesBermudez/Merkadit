salesService = require('../Services/salesService');

async function registerSaleController(req, res) {
    const data = req.body;
    const result = await salesService.registerSaleService(data);
    res.json({message: 'registro exitoso', result});
}

async function getInvoicesController(req, res) {
    const result = await salesService.getInvoicesService();
    res.json({data: result});
}

module.exports = {
    registerSaleController,
    getInvoicesController
};