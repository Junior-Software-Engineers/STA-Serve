const { mysqlDataContext } = require('../dataContexts');
const { institutionMessage } = require('../../fixtures/messageStatus.json');

class InstitutionTransactions {
    constructor() {
        this._datacontext = mysqlDataContext.connection();
    }

    async insertAsync(values) {
        return new Promise((resolve, reject) => {
            this._datacontext.query(`INSERT INTO tblInstitution SET ?`, values, (error, result) => {
                if (!error) {
                    if (result.affectedRows)
                        resolve(institutionMessage.insert.Ok);
                    else
                        reject(institutionMessage.insert.Internal_Server_Error)
                }
                else {
                    reject(error.errno == 1062 ? institutionMessage.insert.Conflict : { status: 500, message: error.message });
                }
            });
        });
    }

    async updateAsync(values) {
        return new Promise((resolve, reject) => {
            this._datacontext.query(`UPDATE tblInstitution SET ? WHERE InstitutionID=?`, [values, values.InstitutionID], (error, result) => {
                if (!error) {
                    if (result.affectedRows)
                        resolve(institutionMessage.update.Ok);
                    else
                        reject(institutionMessage.update.Internal_Server_Error)
                }
                else {
                    reject(error.errno == 1062 ? institutionMessage.insert.Conflict : { status: 500, message: error.message });
                }
            });
        });
    }
}

module.exports = InstitutionTransactions;