require "json"

require "temboo"
require "Library/YouTube"

class JSONExample
    def initialize()
        @session = TembooSession.new("anmol1771", "SF", "8896dc9a19f94248884de4369dd9b50f")
    end

    def parse_json()
        search_choreo = YouTube::Search::ListSearchResults.new(@session)

        # Get an InputSet object for the choreo
        search_inputs = search_choreo.new_input_set()

        # Set inputs
        search_inputs.set_Query("kobe bryant")

        # Execute Choreo
        search_results = search_choreo.execute(search_inputs)

        data = JSON.parse(search_results.get_Response())

        title = data["items"][0]["snippet"]["title"]
        description = data["items"][0]["snippet"]["description"]

        printf("The description for %s is: %s\n", title, description)
    end
end

instance = JSONExample.new()
instance.parse_json()