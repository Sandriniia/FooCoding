const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();
const { password } = process.env;

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'sandra',
  password: password,
  database: 'new_world',
});

connection.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('mysql connected...');
});

const app = express();

app.get('/capital', (req, res) => {
  let capital =
    'SELECT city.Name FROM city JOIN country ON city.ID = country.Capital WHERE country.Name = ?';

  connection.query(capital, 'Afghanistan', (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send(result);
  });
});

app.get('/language', (req, res) => {
  let language =
    'SELECT countrylanguage.Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Region = ?';

  connection.query(language, 'Eastern Europe', (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send(result);
  });
});

app.get('/cities', (req, res) => {
  let cities =
    'SELECT COUNT(city.ID) AS cities_number FROM city JOIN countrylanguage AS cl ON city.CountryCode = cl.CountryCode WHERE cl.Language = ?';

  connection.query(cities, 'Dutch', (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send(result);
  });
});

app.get('/continents', (req, res) => {
  let continents =
    'SELECT COUNT(countrylanguage.language) AS number_of_languages, country.Continent FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code GROUP BY Continent';

  connection.query(continents, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send(result);
  });
});

app.listen('3000', () => {
  console.log('Server 3000');
});
