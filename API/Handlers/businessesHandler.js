const express = require('express');
const businessesController = require('../Controllers/businessesController');
const router = express.Router();

router.post('/settleBusiness', businessesController.settleBusiness);


module.exports = router;