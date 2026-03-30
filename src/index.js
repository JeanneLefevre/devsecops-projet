// main.js
const express = require('express');
const app = express();
const PORT = 3000;

// Middleware pour JSON
app.use(express.json());

// Route racine
app.get('/', (req, res) => {
  res.send('Hello from Coucou API!');
});

// Exemple de route API
app.get('/api/users', (req, res) => {
  res.json([
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' }
  ]);
  res.send('Hello', res.name)
});

// Lancer le serveur
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});