from _future_ import print_function
from flask import Flask, request ,jsonify
import werkzeug
import cv2

app = Flask(_name_)

@app.route('/upload', methods=["POST"])
def upload():
    if (request.method == "POST"):
        imagefile = request.files['image']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        imagefile.save("/home/username/images/"+ filename)
        im = cv2.imwrite('/home/username/mysite/image_name',img)
        im = Image.open("/home/username/images/"+ filename)

        def :
           
              //value = 
        return jsonify({
            "message": value,
            "id": 0 ,
        })
