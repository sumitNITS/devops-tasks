from flask import Flask, jsonify, request
import datetime

app = Flask(__name__)

@app.route('/')
def simple_time_service():
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    ip_address = request.remote_addr
    response_data = {
        "timestamp": timestamp,
        "ip": ip_address
    }
    return jsonify(response_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
