class Foo {
  scaledName() {
    if (this.state.name && this.state.name.length <= 11) {
      return (
        <div className="name-preview">
          {this.state.name}
        </div>
      );
    } else if (this.state.name && this.state.name.length > 11) {
      var length = this.state.name.length;
      var fontScale = 203 - (length - 11);
      var stringPercent = fontScale.toString() + '%';
      return (
        <div className="name-preview" style={{ fontSize: stringPercent }}>
          {
            this.state.name,
            console.log(stringPercent, 'font-size'),
            console.log(this.state.name, 'Név')
          }
        </div>
      );
    }
  }
}
