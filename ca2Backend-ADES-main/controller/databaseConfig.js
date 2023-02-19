/* eslint-disable linebreak-style */
/* eslint-disable no-console */
// sanity check
console.log('--------------------------------------');
console.log('databaseconfig.js');
console.log('--------------------------------------');

//= ======================================================
//              Imports
//= ======================================================
const mysql = require('mysql');

//= ======================================================
//              Objects / Functions
//= ======================================================
const dbconnect = {
  getConnection() {
    const conn = mysql.createConnection({
      host: 'us-cdbr-east-06.cleardb.net',
      user: 'bc83616d2194ff',

      password: '9b326c0b',

      database: 'heroku_9a069375239a622',
    });
    return conn;
  },
};

//= ======================================================
//              Exports
//= ======================================================
module.exports = dbconnect;
