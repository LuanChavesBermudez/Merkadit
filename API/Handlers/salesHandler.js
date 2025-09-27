const express = require('express');
const salesController = require('../Controllers/salesController');
const router = express.Router();

router.post('/registerSale', salesController.registerSaleController);

router.get('/invoices', salesController.getInvoicesController);

module.exports = router;