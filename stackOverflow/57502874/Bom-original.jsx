const Bom = (obj) => {
  return (
    <div className="outerContainer">
      {
        Object
          .keys(obj)
          .forEach((key, _item) => {
            return (
              <div className="category" key={key}>
                {key}

                {
                  Object
                    .keys(obj[key])
                    .forEach(value =>
                      return (
                        <div className="item" key={value}>{value}</div>
                      );
                    })
                }
              </div>
            )
          })
      }
    </div>
  )
}
