import mqtt from 'mqtt'

const client = mqtt.connect('mqtt:127.0.0.1')

client.on('connect', function () {
  client.subscribe('presence')
  client.publish('presence', 'ohai')
})

client.on('message', function (topic, message, packet) {
  console.log(`${topic} => ${message.toString()}`)
  console.log(JSON.stringify(packet, null, 2))
  client.end()
})
