var WateringForm = React.createClass({
  getInitialState() {
    return { watering: false,
             duration: 0 };
  },

  handleWater(event) {
    event.preventDefault();
    var zoneData = {
      zoneId: this.refs.zoneId.value,
      zoneDuration: this.refs.zoneDuration.value * 60
    }
    this.props.waterZone(zoneData);
    this.setState( { watering: true,
                     duration: this.refs.zoneDuration.value
                   });
  },



  render() {
    var zone = this.props.zone
    var previousDurationMinutes = parseInt(zone.lastWateredDuration / 60.0)
    var zoneDuration = this.state.duration;
    var formState;
    if (this.state.watering) {
      return (
        <div>
          <h5>Watering {zone.name} for {zoneDuration} minutes!</h5>
          <img src={zone.customNozzle.imageUrl} height='60px' width="auto"/>
        </div>
      )
    } else {
      return (
        <form >
          <h6>Watering Duration</h6>
          <input type="number" ref="zoneDuration" max="180" min="1" placeholder={previousDurationMinutes+ " mins"} required />
          <input type="hidden" ref="zoneId" value={zone.id} />
          <button type="submit" onClick={this.handleWater} className="btn center">Water {zone.name}</button>
        </form>
      )
    }
    console.log(formState)
    return(
      {formState}
    )
  }
})