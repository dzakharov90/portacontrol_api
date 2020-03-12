const express = require('express')
const app = express()
const router = express.Router();
const port = 8000

app.get('/', (req, res) => {
  res.status(200).json({info: "Dzinga PortaControl API Interface"});
});

app.get('/api', (req, res) => {
  res.status(200).json({info: "Dzinga PortaControl API Interface"});
});

app.get('/api/v1/', (req, res) => {
  res.status(200).json({info: "Dzinga PortaControl API Interface"});
});

app.get('/api/v1/getTrunkList', async (req, res) => {
  const config = require('./knexfile');
  const env = 'production';
  const knex = require('knex')(config[env]);
  try {
    const [getTrunkList] = await knex('sip_trunks')
      .select('gateway_name','username','realm','expireseconds','registertrans','pingenabled','enabled')
      .then((getTrunkList)=> {
      if (getTrunkList) {
        res.setHeader('Content-Type', 'application/json')
        res.setHeader('X-Powered-By', 'Dzinga')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(200).json({TrunkList: getTrunkList})
      } else {
        res.setHeader('Content-Type', 'application/json');
        res.setHeader('X-Powered-By', 'Dzinga API')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(404).json({message: "Trunks not found"})
      }
  })
  } catch (err) {
    res.setHeader('Content-Type', 'application/json');
    res.setHeader('X-Powered-By', 'Dzinga API')
    res.setHeader('User-Agent', 'Dzinga API')
    res.status(500).json({message: "Error getting trunk list", error: err})
  }
});

app.get('/api/v1/getTrunkEnabled', async (req, res) => {
  const config = require('./knexfile');
  const env = 'production';
  const knex = require('knex')(config[env]);
  try {
    const [getTrunkList] = await knex('sip_trunks')
      .select('gateway_name','username','realm','expireseconds','registertrans','pingenabled')
      .where({
        enabled: true
      })
      .then((getTrunkList)=> {
      if (getTrunkList) {
        res.setHeader('Content-Type', 'application/json')
        res.setHeader('X-Powered-By', 'Dzinga')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(200).json({TrunkEnabled: getTrunkList})
      } else {
        res.setHeader('Content-Type', 'application/json')
        res.setHeader('X-Powered-By', 'Dzinga')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(404).json({message: "Trunks not found"})
      }
  })
  } catch (err) {
    res.setHeader('Content-Type', 'application/json')
    res.setHeader('X-Powered-By', 'Dzinga')
    res.setHeader('User-Agent', 'Dzinga API')
    res.status(500).json({message: "Error getting trunk list", error: err})
  }
});

app.get('/api/v1/disableTrunk', async (req, res) => {
  const config = require('./knexfile');
  const env = 'production';
  const knex = require('knex')(config[env]);
  const axios = require('axios');
  var username = req.query.username
  if (username == null ){
    res.status(404).json({message: "username variable required but is NULL"})
  };
  try {
    const [disableTrunk] = await knex('sip_trunks')
      .update('enabled', 'false')
      .where('username', username)
      .then((disableTrunk)=> {
      if (disableTrunk) {
        res.setHeader('Content-Type', 'application/json')
        res.setHeader('X-Powered-By', 'Dzinga')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(200).json({message: "Success"})
        axios.get('http://127.0.0.1:8080/webapi/reloadxml', {
          auth: {
            username: 'freeswitch',
            password: 'works'
          },
        })
        .then(response => {
          console.log(response.data.url);
          console.log(response.data.explanation);
        })
        .catch(error => {
        console.log(error);
        });
        axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20rescan', {
          auth: {
            username: 'freeswitch',
            password: 'works'
          },
        })
        .catch(error => {
        console.log(error);
        });
        axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20restart', {
          auth: {
            username: 'freeswitch',
            password: 'works'
          },
        })
        .catch(error => {
        console.log(error);
        });
      } else {
        res.setHeader('Content-Type', 'application/json');
        res.setHeader('X-Powered-By', 'Dzinga API')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(404).json({message: "Trunk not found"})
      }
  })
  } catch (err) {
    res.setHeader('Content-Type', 'application/json');
    res.setHeader('X-Powered-By', 'Dzinga API')
    res.setHeader('User-Agent', 'Dzinga API')
    res.status(500).json({message: "Error disabling trunk", error: err})
  }
});

app.get('/api/v1/enableTrunk', async (req, res) => {
  const config = require('./knexfile');
  const env = 'production';
  const knex = require('knex')(config[env]);
  const axios = require('axios');
  var username = req.query.username
  if (username == null ){
    res.status(404).json({message: "username variable required but is NULL"})
  };
  try {
    const [enableTrunk] = await knex('sip_trunks')
      .update('enabled', 'true')
      .where('username', username)
      .then((enableTrunk)=> {
      if (enableTrunk) {
        res.setHeader('Content-Type', 'application/json')
        res.setHeader('X-Powered-By', 'Dzinga')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(200).json({message: "Success"})
        axios.get('http://127.0.0.1:8080/webapi/reloadxml', {
          auth: {
            username: 'freeswitch',
            password: 'works'
          },
        })
        .then(response => {
          console.log(response.data.url);
          console.log(response.data.explanation);
        })
        .catch(error => {
        console.log(error);
        });
        axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20rescan', {
          auth: {
            username: 'freeswitch',
            password: 'works'
          },
        })
        .then(response => {
          console.log(response.data.url);
          console.log(response.data.explanation);
        })
        .catch(error => {
        console.log(error);
        });
        axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20restart', {
          auth: {
            username: 'freeswitch',
            password: 'works'
          },
        })
        .catch(error => {
        console.log(error);
        });
      } else {
        res.setHeader('Content-Type', 'application/json');
        res.setHeader('X-Powered-By', 'Dzinga API')
        res.setHeader('User-Agent', 'Dzinga API')
        res.status(404).json({message: "Trunk not found"})
      }
  })
  } catch (err) {
    res.setHeader('Content-Type', 'application/json');
    res.setHeader('X-Powered-By', 'Dzinga API')
    res.setHeader('User-Agent', 'Dzinga API')
    res.status(500).json({message: "Error enabling trunk", error: err})
  }
});

app.put('/api/v1/addTrunk', async (req, res) => {
  const config = require('./knexfile');
  const env = 'production';
  const knex = require('knex')(config[env]);
  const axios = require('axios');
  var name = req.query.name
    username = req.query.username
    password = req.query.password
    realm = req.query.realm
    options = req.query.options
    expires = req.query.expires
    enabled = req.query.enabled
    if (name == null ){
      res.status(404).json({message: "name variable required but is NULL"})
    };
    if (username == null ){
      res.status(404).json({message: "username variable required but is NULL"})
    };
    if (password == null ){
      res.status(404).json({message: "password variable required but is NULL"})
    };
    if (realm == null ){
      res.status(404).json({message: "realm variable required but is NULL"})
    };
    if (options == null ){
      res.status(404).json({message: "options variable required but is NULL"})
    };
    if (expires == null ){
      res.status(404).json({message: "expires variable required but is NULL"})
    };
    if (enabled == null ){
      res.status(404).json({message: "enabled variable required but is NULL"})
    };
    if (options !=='true' && options !=='false' ){
      res.status(404).json({message: "options required 'true' or 'false' value", options })
    };
    if (enabled !=='true' && enabled !=='false' ){
      res.status(404).json({message: "enabled required 'true' or 'false' value", enabled })
    };
    try {
      const [addTrunk] = await knex('sip_trunks')
        .insert([{'gateway_name': name, 'username': username, 'realm': realm, 'fromuser': username, 'fromdomain': realm, 'password': password, 'extension': username, 'proxy': realm, 'registerproxy': realm, 'expireseconds': expires, 'register': 'true','registertrans': 'udp', 'retryseconds': '30', 'calleridinfrom': 'true', 'pingenabled': options, 'pingtime': '30', 'sip_interfaces': 'external', 'enabled': enabled}])
        .then((addTrunk)=> {
        if (addTrunk) {
          res.setHeader('Content-Type', 'application/json')
          res.setHeader('X-Powered-By', 'Dzinga')
          res.setHeader('User-Agent', 'Dzinga API')
          res.status(200).json({message: "Success"})
          axios.get('http://127.0.0.1:8080/webapi/reloadxml', {
            auth: {
              username: 'freeswitch',
              password: 'works'
            },
          })
          .then(response => {
            console.log(response.data.url);
            console.log(response.data.explanation);
          })
          .catch(error => {
          console.log(error);
          });
          axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20rescan', {
            auth: {
              username: 'freeswitch',
              password: 'works'
            },
          })
          .then(response => {
            console.log(response.data.url);
            console.log(response.data.explanation);
          })
          .catch(error => {
          console.log(error);
          });
          axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20restart', {
            auth: {
              username: 'freeswitch',
              password: 'works'
            },
          })
          .catch(error => {
          console.log(error);
          });
        } else {
          res.setHeader('Content-Type', 'application/json');
          res.setHeader('X-Powered-By', 'Dzinga API')
          res.setHeader('User-Agent', 'Dzinga API')
          res.status(404).json({message: "Trunk not found"})
        }
    })
    } catch (err) {
      res.setHeader('Content-Type', 'application/json');
      res.setHeader('X-Powered-By', 'Dzinga API')
      res.setHeader('User-Agent', 'Dzinga API')
      res.status(500).json({message: "Error trunk add", error: err})
    }
  });

  app.get('/api/v1/delTrunk', async (req, res) => {
    const config = require('./knexfile');
    const env = 'production';
    const knex = require('knex')(config[env]);
    const axios = require('axios');
    var username = req.query.username
    if (username == null ){
      res.status(404).json({message: "username variable required but is NULL"})
    };
    try {
      const [delTrunk] = await knex('sip_trunks')
        .where('username', username)
        .del()
        .then((delTrunk)=> {
        if (delTrunk) {
          res.setHeader('Content-Type', 'application/json')
          res.setHeader('X-Powered-By', 'Dzinga')
          res.setHeader('User-Agent', 'Dzinga API')
          res.status(200).json({message: "Success"})
          axios.get('http://127.0.0.1:8080/webapi/reloadxml', {
            auth: {
              username: 'freeswitch',
              password: 'works'
            },
          })
          .then(response => {
            console.log(response.data.url);
            console.log(response.data.explanation);
          })
          .catch(error => {
          console.log(error);
          });
          axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20rescan', {
            auth: {
              username: 'freeswitch',
              password: 'works'
            },
          })
          .then(response => {
            console.log(response.data.url);
            console.log(response.data.explanation);
          })
          .catch(error => {
          console.log(error);
          });
          axios.get('http://127.0.0.1:8080/webapi/sofia?profile%20external%20restart', {
            auth: {
              username: 'freeswitch',
              password: 'works'
            },
          })
          .catch(error => {
          console.log(error);
          });
        } else {
          res.setHeader('Content-Type', 'application/json');
          res.setHeader('X-Powered-By', 'Dzinga API')
          res.setHeader('User-Agent', 'Dzinga API')
          res.status(404).json({message: "Trunk not found"})
        }
    })
    } catch (err) {
      res.setHeader('Content-Type', 'application/json');
      res.setHeader('X-Powered-By', 'Dzinga API')
      res.setHeader('User-Agent', 'Dzinga API')
      res.status(500).json({message: "Error deleting trunk", error: err})
    }
  });

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})
