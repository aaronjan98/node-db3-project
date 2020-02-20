const db = require("../data/db-configs.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update
};

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
            .where({ id })
            .first();
}

function findSteps(id) {
    return db('steps as st')
            .join('schemes as sc', 'sc.id', 'st.scheme_id')
            .select('st.*', 'sc.scheme_name')
            .where('scheme_id', id);
}

function add(scheme) {
    return db('schemes').insert(scheme, 'id');
}

function update(id, changes) {
    return db('schemes')
      .where({ id })
      .update(changes);
}