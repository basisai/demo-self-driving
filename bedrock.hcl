version = "1.0"

serve {
    image = "python:3.7"
    install = ["pip install streamlit"]
    script = [
        {sh = [
              "streamlit hello --server.headless true --server.port ${BEDROCK_SERVER_PORT}",
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
