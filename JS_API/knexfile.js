// Update with your config settings.

module.exports = {

  development: {
    client: 'pg',
    connection: 'postgres://portacontrol:dPegVuUtq@127.0.0.1:5432/portacontrol',
    migrations: {
      tableName: 'portacontrol_migrations'
    }
  },

  staging: {
    client: 'pg',
    connection: 'postgres://portacontrol:dPegVuUtq@127.0.0.1:5432/portacontrol',
    migrations: {
      tableName: 'portacontrol_migrations'
    }
  },

  production: {
    client: 'pg',
    connection: 'postgres://portacontrol:dPegVuUtq@127.0.0.1:5432/portacontrol',
    migrations: {
      tableName: 'portacontrol_migrations'
    }
  }
};
