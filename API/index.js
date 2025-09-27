const express = require('express');
const app = express();
const port = 3000;
const salesHandler = require('./Handlers/salesHandler');

app.use(express.json());
app.use('/sales', salesHandler);

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});