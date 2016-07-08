class Timer
    def initialize(app)
        @app = app
    end

    def call(env)
        start = Time.now
        status, header, response = @app.call(env)
        stop = Time.now
        header['X-Timing'] = (stop - start).to_s
        [status, header, response]
    end
end
