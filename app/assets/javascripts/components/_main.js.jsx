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
      devices: {},
      zones: {}
    }
  }

  render() {
    return (
      <div>
        < Header />
      </div>
    )
  }
};