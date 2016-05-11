'use strict';

var Device = React.createClass({
  render() {
    return(
      <div>
        <h5>Device ID: {this.props.device.device_id}</h5>
      </div>
    )
  }
});