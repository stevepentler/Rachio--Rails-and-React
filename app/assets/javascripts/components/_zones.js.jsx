'use strict';

var Zones = React.createClass({
  getInitialState() {
    return { zones: [] };
  },

  componentDidMount() {
    $.getJSON('/api/v1/data', (response) => { this.setState({ zones: response}) });
  },

  render() {
    console.log(this.state.zones)
    let zones = this.state.zones.map((zone) => {
      return (
        <div key={zone.id} >
          <h3>{zone.name}</h3>
          <span>Previous Duration: {zone.lastWateredDuration} minutes</span>
            <form ref="waterForm" onSubmit={this.startTimer} >
              <input type="number" ref="time" placeholder="Watering Duration (minutes)"/>
              <button type="submit">Start Watering </button>
            </form>
        </div>
      )
    });

    return(
      <div>
        {zones}
      </div>
    )
  }
});