'use strict';

var Device = React.createClass({
  render() {
    var device_id = this.props.device.device_id;
    return(
      <div>
        <h5>Device ID: {device_id}</h5>
        < Zone device={this.props.device} zones={this.props.zones} />
      </div>
    )
  }
});