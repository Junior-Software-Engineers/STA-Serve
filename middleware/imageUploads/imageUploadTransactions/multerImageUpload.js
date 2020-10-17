const multer = require('multer');
const ImageUpload = require('../base/imageUpload');
const fs = require('fs');
const { promisify } = require('util');
const { imageUpload } = require('../../../fixtures/messageStatus.json');

class MulterImageUpload extends ImageUpload {
    constructor() {
        super();
    }

    upload(req, res, next) {
        multer({
            storage: multer.diskStorage({
                destination: function (req, file, cb) {
                    cb(null, `./uploads/${req.path.replace(/[^a-zA-Z -]/g, '').replace('image','')}`);
                },
                filename: function (req, file, cb) {
                    cb(null, new Date().toISOString().replace(/[^0-9]/g, '-') + file.originalname);
                }
            }),
            limits: {
                fileSize: 1024 * 1024 * 5,
                files: 1
            },
            fileFilter: (req, file, cb) => {
                if (!file.originalname.match(/\.(jpg|jpeg|png)$/)) {
                    return cb(new Error('Only Images are allowed !'), false);
                }

                cb(null, true);
            },

        }).single('Image')(req, res, function (err) {
            if (err instanceof multer.MulterError || err || req.file == null) {
                res.status(imageUpload.status).json({ message: imageUpload.message });
            } else {
                next();
            }
        });
    }

    remove = promisify(fs.unlink);
}

module.exports = MulterImageUpload;