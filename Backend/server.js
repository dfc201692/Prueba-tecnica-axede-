const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');
const app = express();
const port = 3000; // Cambia el puerto según tus preferencias

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors()); 

// Configuración de la conexión a la base de datos MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'hotel'
});

db.connect(err => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
  } else {
    console.log('Conexión a la base de datos exitosa');
  }
});

// Ruta para guardar un reserva
app.post('/reservas', (req, res) => {
  const { idHabitacion, fechaInicio, fechaFin, numeroPersonas } = req.body;

  const query = 'INSERT INTO reservas (idHabitacion, FechaInicio, FechaFin, NumeroPersonas) VALUES (?, ?, ?, ?)';
  db.query(query, [idHabitacion, fechaInicio, fechaFin, numeroPersonas], (err, result) => {
    if (err) {
      console.error('Error al guardar la reserva:', err);
      res.status(500).send('Error al guardar la reserva');
    } else {
      res.json({ message: 'Reserva guardada con éxito', idReserva: result.insertId });
    }
  });
});

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor iniciado en http://localhost:${port}`);
});
