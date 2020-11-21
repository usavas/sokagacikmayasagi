class TimeLeft {
  int hours;
  int minutes;

  TimeLeft(int totalMinutes) {
    this.hours = (totalMinutes / 60).floor();
    this.minutes = totalMinutes % 60;
  }

  decreaseMinutes() {
    if (this.minutes > 0) {
      this.minutes--;
    } else {
      if (this.hours > 0) {
        this.hours--;
        this.minutes = 59;
      }
    }
  }

  bool isTimeLeft() {
    return (this.minutes != 0 || this.hours != 0);
  }

  @override
  String toString() {
    return "${this.hours.toString()} saat ${this.minutes.toString()} dakika";
  }
}
