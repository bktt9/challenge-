const flattedData = response.flatMap((item, index) => [item.tracks]).flat();
const data = [];
flattedData.forEach((item) => {
  if (data.length === 0) {
    data.push({ x: item.timestp, y: 1, tooltip: [item.trackName] });
  } else {
    const index = data.findIndex((_item) => _item.x === item.timestp);
    if (index > -1) {
      data[index] = {
        ...data[index],
        y: data[index].y + 1,
        tooltip: [...data[index].tooltip, item.trackName]
      };
    } else {
      data.push({ x: item.timestp, y: 1, tooltip: [item.trackName] });
    }
  }
});

console.log(data);