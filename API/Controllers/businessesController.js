businessesService = require('../Services/businessesService');

async function settleBusiness(req, res) {
    const data = req.body;
    const result = await businessesService.settleBusiness(data);
    res.json({message: 'registro exitoso', result});
}

module.exports = {
    settleBusiness
};