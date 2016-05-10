'use strict';

class Main extends React.Component {
  loadData() {
    $.ajax({
      url: '/api/v1/data',
      type: 'GET',
      success: (response) => {
        console.log('Data Loaded', response);
      }
    })
  }
  componentDidMount() {
    loadData();
  }


  render() {
    return (
      <div>
        <h1>Steve</h1>
        < Header />
      </div>
    )
  }
};