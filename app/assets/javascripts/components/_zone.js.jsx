'use strict';

var Zones = React.createClass({
  getInitialState() {
    return { zones: [] };
  },

  componentDidMount() {
    $.getJSON('/api/v1/data', (response) => { this.setState({ zones: response}) });
  },

  render() {
    let zones = this.state.zones.map((zone) => {
      return (
        <div>
          <h3>{zone.id}</h3>
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