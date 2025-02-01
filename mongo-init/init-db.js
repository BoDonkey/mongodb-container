db.createUser({
  user: 'apostrophe',
  pwd: 'devpassword',
  roles: [
    {
      role: 'readWrite',
      db: 'apostrophe'
    }
  ]
});

db.createCollection('apostrophe');