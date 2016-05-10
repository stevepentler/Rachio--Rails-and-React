'use strict';

class Main extends React.Component {
  componentDidMount() {
    loadData();
  }

  loadData() {
    $.ajax({
      url: '/api/v1/data',
      type: 'GET',
      success: (response) => {
        console.log('Data Loaded', response);
      }
    })
  }

  constructor() {
    super();
    this.state = {
      zones: {}
    }
  }

  addZone(zone_id, device_id) {
    this.setState({
      zones: {zone_id: device_id}
    })
  }

  render() {
    return (
      <div>
        < Header />


      </div>
    )
  }
};