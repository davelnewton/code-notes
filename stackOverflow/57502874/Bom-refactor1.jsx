const obj = {
    operation: {
      speed:     "slow",
      direction: "forward",
      status:    "moving",
    },
    detail: {
      type:       "electric",
      drivetrain: "AWD"
    }
  }
}

const Item = ({ value }) => (
  <div className="item">{value}</div>
)

const Category = ({ key, obj }) => {
  return (
    <div className="category">
      {key}

      {Object.keys(obj).map(val => <Item key={val} value={val} />)}
    </div>
  )
}

const Bom = obj => (
  <div className="outerContainer">
    {Object.keys(obj).map(cat => <Category key={cat} obj={obj[cat]} />)}
  </div>
)
