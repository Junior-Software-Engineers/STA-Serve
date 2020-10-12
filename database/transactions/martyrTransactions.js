const { mysqlDataContext } = require('../dataContexts');
const { martyrMessages } = require('../../fixtures/messageStatus.json');

class MartyrTransactions {
    constructor() {
        this._datacontext = mysqlDataContext.connection();
    }

    async insertAsync(values) {
        return new Promise((resolve, reject) => {
            this._datacontext.query(`INSERT INTO tblMartyr SET ?`, values, (error, result) => {
                if (!error) {
                    if (result.affectedRows)
                        resolve(martyrMessages.insert.Ok);
                    else
                        reject(martyrMessages.insert.Internal_Server_Error)
                }
                else {
                    reject(error.errno == 1062 ? martyrMessages.insert.Conflict : { status: 500, message: error.message });
                }
            });
        });
    }

    async updateAsync(values) {
        return new Promise((resolve, reject) => {
            this._datacontext.query(`UPDATE tblMartyr SET ? WHERE MartyrID=?`, [values, values.MartyrID], (error, result) => {
                if (!error) {
                    if (result.affectedRows)
                        resolve(martyrMessages.update.Ok);
                    else
                        reject(martyrMessages.update.Internal_Server_Error)
                }
                else {
                    reject(error.errno == 1062 ? martyrMessages.insert.Conflict : { status: 500, message: error.message });
                }
            });
        });
    }

    async findAsync(MartyrID) {
        return new Promise((resolve, reject) => {
            this._datacontext.query(`SELECT * FROM tblMartyr WHERE MartyrID=?`, [MartyrID], (error, result) => {
                if (!error) {
                    if (result.length > 0)
                        resolve(result[0]);
                    else
                        reject(martyrMessages.list.Not_Found);
                }
                else {
                    reject({ status: 500, message: error.message });
                }
            });
        });
    }
}

module.exports = MartyrTransactions;