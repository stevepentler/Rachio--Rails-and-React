var WateringForm = React.createClass({
  handleWater(event) {
    event.preventDefault();
    var zoneData = {
      zoneId: this.refs.zoneId.value,
      zoneDuration: this.refs.zoneDuration.value * 60
    }
    this.props.waterZone(zoneData);
  },

  render() {
    var zone = this.props.zone
    var previousDurationMinutes = parseInt(zone.lastWateredDuration / 60.0)
    return(
      <form >
        <h6>Watering Duration</h6>
        <input type="number" ref="zoneDuration" max="180" min="1" placeholder={previousDurationMinutes+ " mins"} required />
        <input type="hidden" ref="zoneId" value={zone.id} />
        <button type="submit" onClick={this.handleWater} className="btn center">Water {zone.name}</button>
      </form>
    )
  }
})