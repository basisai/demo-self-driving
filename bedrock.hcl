version = "1.0"

train {
    step step0 {
        image = "python:3.6-slim"
        script = [
            { sh = ["python3 train.py"] }
        ]

        resources {
            cpu = "0.5"
            memory = "200M"
        }
    }

    parameters {
        ALPHA = "0.5"
        L5_RATIO = "0.5"
    }

    secrets = [
        "DUMMY_SECRET_A",
        "DUMMY_SECRET_B"
    ]
}

serve {
    image = "python:3.7"
    install = ["pip install streamlit"]
    script = [
        {sh = [
              "streamlit hello --server.headless true --server.enableCORS false --server.port ${BEDROCK_SERVER_PORT} --browser.serverAddress ${BEDROCK_ENDPOINT_ID}.pub.playground.bdrk.ai --browser.serverPort 443",
        ]}
    ]

    parameters {
        SERVE_PARAMS_A = "serve_a"
        SERVE_PARAMS_B = "serve_b"
    }

    secrets = [
        "SERVE_SECRET_A",
        "SERVE_SECRET_B"
    ]
}

batch_score {
    step step0 {
        image = "python:3.6-slim"

        script =  [
            { sh = ["python3 batch_score.py"] }
        ]

        resources {
            cpu = "0.5"
            memory = "200M"
        }
    }

    parameters {
        ALPHA = "0.1"
        L5_RATIO = "0.2"
    }

    secrets = [
        "DUMMY_SECRET_E",
        "DUMMY_SECRET_F"
    ]
}
