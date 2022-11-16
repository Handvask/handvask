import minizinc as mz
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route( '/', methods=['GET', 'POST'] )
def get_solution():
    content = request.json
    m = mz.Model()
    m.add_string( content.get('model') )
    m.add_string( content.get('data') )
    inst = mz.Instance(
        mz.Solver.lookup( content.get('solver') ),
        m
    )
    return jsonify( inst.solve().solution )

if __name__ == '__main__':
    app.run( host='0.0.0.0', port=5000 )