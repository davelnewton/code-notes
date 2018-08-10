const ScaledName = ({ value, startingScale=203, scaleAtLength=11, scaleFactor=1 }) => {
  if (isEmpty(value)) {
    return null;
  }

  const styles = {};

  if (value.length > scaleAtLength) {
    const scaleDelta = (value.length - scaleAtLength) * scaleFactor;
    const fontScale = startingScale - scaleDelta;

    styles.fontSize = `${fontScale}%`;
  }

  return (
    <div className="name-preview" style={styles}>
      {value}
    </div>
  );
};

class Foo {
  scaledName() {
    const { name } = this.state;

    if (!name) {
      return null;
    }

    if (name.length <= 11) {
      return (
        <div className="name-preview">
          {name}
        </div>
      );
    }

    const fontScale = 214 - name.length;
    return (
      <div className="name-preview" style={{ fontSize: `${fontScale}%` }}>
        {name}
      </div>
    );
  }
}
