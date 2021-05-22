# AsaCoco Store

[![Crystal CI](https://github.com/AsaCoco-Store/AsaCoco-Store/actions/workflows/crystal.yml/badge.svg)](https://github.com/AsaCoco-Store/AsaCoco-Store/actions/workflows/crystal.yml)

## Installation

1. Clone this repository.

```
git clone https://github.com/AsaCoco-Store/AsaCoco-Store.git
cd AsaCoco-Store
```

2. Compile it.

```
shards build
```

## Usage

Run the executable and the website will be generated in `dist`

```
bin/asacoco_store
```

## Development

To add a new product, edit `src/products.yml` and upload the image to `src/assets`.

### Product

| name    | description            | type    | required |
|:-------:|:----------------------:|:-------:|:--------:|
| name    | product name           | string  | true     |
| type    | AsaCoco type           | string  | false    |
| image   | image file name        | string  | true     |
| srp     | suggested retail price | integer | false    |
| price   | price                  | integer | true     |
| monthly | monthly                | boolean | false    |
| url     | real product url       | string  | false    |
| cm      | advertisement          | CM      | true     |

#### CM

| name       | description                     | type    | required |
|:----------:|:-------------------------------:|:-------:|:--------:|
| id         | AsaCoco YouTube video ID        | string  | true     |
| start_time | advert starting time in seconds | integer | true     |
| end_time   | advert ending time in seconds   | integer | true     |

## Contributing

1. Fork it (<https://github.com/AsaCoco-Store/asacoco-store/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Tatsujin Chin](https://github.com/c910335) - creator and maintainer

## Special Thanks

Kiryu Coco

- [YouTube](https://www.youtube.com/channel/UCS9uQI-jC3DE0L4IpXyvr6w)
- [Twitter](https://twitter.com/kiryucoco)

## Credits

- [Logo](src/assets/logo.png) by [buff🐉(ホロライブ箱推し)](https://twitter.com/buff47213168/status/1310568035061645312)

## License

All images are copyright to Cover Corp.

The other parts are licensed under the MIT License.
