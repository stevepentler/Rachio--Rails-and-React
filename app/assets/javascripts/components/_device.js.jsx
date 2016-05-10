'use strict';

class Device extends React.Component {
  componentDidMount() {
      $.ajax({
      url: '/api/v1/devices',
      type: 'GET',
      success: (response) => {
        this.props.addDevice(response.device_id)
      }
    })
  }

  render() {
    return (
      <div>
        <h1>Steve</h1>
      </div>
    )
  }
};