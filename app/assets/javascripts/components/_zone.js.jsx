'use strict';

var Zone = React.createClass({
  render() {
    var zone = this.props.zone
    var date = new Date(zone.lastWateredDate).toLocaleString();
    return(
      <div>
        <h2>{zone.name}</h2>
        <h6>Previous Watering: {zone.lastWateredDuration} mins on {date}</h6>
      </div>
    )
  }

});