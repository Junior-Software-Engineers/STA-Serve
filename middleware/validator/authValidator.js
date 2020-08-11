const { validator } = require('../../utils');
const { validateMessage } = require('../../fixtures/messageStatus.json');

class AuthValidator {
    constructor() { }

    static login(req, res, next) {
        const body = req.body;
        if (validator.isInt(body.UserIdentityNo) && !validator.isEmpty(body.UserPassword))
            next();
        else
            res.status(validateMessage.status).json({ message: validateMessage.message });
    }

    static signUp(req, res, next) {
        const body = req.body;
        const state = !validator.isEmpty(body.UserFirstName)
            && !validator.isEmpty(body.UserLastName)
            && validator.isInt(body.UserIdentityNo)
            && validator.isEmail(body.UserEmail)
            && validator.isMobilePhone(body.UserPhone)
            && !validator.isEmpty(body.UserPassword)
            && validator.isInt(body.InstitutionID)
            && validator.isInt(body.UserStatusID);
        
        if(state)
            next();
        else
            res.status(validateMessage.status).json({ message: validateMessage.message });
    }
}

module.exports = AuthValidator;