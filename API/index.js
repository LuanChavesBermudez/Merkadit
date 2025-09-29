const express = require('express');
const app = express();
const port = 3000;
const salesHandler = require('./Handlers/salesHandler');
const businessesHandler = require('./Handlers/businessesHandler');


app.use(express.json());
app.use('/sales', salesHandler);
app.use('/businesses', businessesHandler);

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});