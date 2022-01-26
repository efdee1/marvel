// import 'dart:convert';
//
// import 'package:marvel/services/api_manager.dart';
// import 'package:http/http.dart'as http;
//
// class MarvelModel{
//   late String picture;
//   late String name;
// }
//
// Future<Marvel> fetchMarvel() async {
//   final response = await http
//       .get(Uri.parse('http://developers.marvel.com/v1/public/characters?&apiKey=c95ce8965c471b169043e399fe49e367'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Marvel.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }




// http://developers.marvel.com/v1/public/characters?&apiKey=c95ce8965c471b169043e399fe49e367


// To parse this JSON data, do
//
//     final marvel = marvelFromJson(jsonString);

import 'dart:convert';

Marvel marvelFromJson(String str) => Marvel.fromJson(json.decode(str));

String marvelToJson(Marvel data) => json.encode(data.toJson());

class Marvel {
  Marvel({
    this.swaggerVersion,
    this.apiVersion,
    this.basePath,
    this.resourcePath,
    this.apis,
    this.models,
  });

  String? swaggerVersion;
  String? apiVersion;
  String? basePath;
  String? resourcePath;
  List<Api>? apis;
  Models? models;

  Marvel marvelFromJson(String str) => Marvel.fromJson(json.decode(str));
  factory Marvel.fromJson(Map<String, dynamic> json) => Marvel(
    swaggerVersion: json["swaggerVersion"],
    apiVersion: json["apiVersion"],
    basePath: json["basePath"],
    resourcePath: json["resourcePath"],
    apis: List<Api>.from(json["apis"].map((x) => Api.fromJson(x))),
    models: Models.fromJson(json["models"]),
  );

  Map<String, dynamic> toJson() => {
    "swaggerVersion": swaggerVersion,
    "apiVersion": apiVersion,
    "basePath": basePath,
    "resourcePath": resourcePath,
    "apis": List<dynamic>.from(apis!.map((x) => x.toJson())),
    "models": models!.toJson(),
  };
}

class Api {
  Api({
    this.path,
    this.description,
    this.operations,
  });

  String? path;
  String? description;
  List<Operation>? operations;

  factory Api.fromJson(Map<String, dynamic> json) => Api(
    path: json["path"],
    description: json["description"],
    operations: List<Operation>.from(json["operations"].map((x) => Operation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "description": description,
    "operations": List<dynamic>.from(operations!.map((x) => x.toJson())),
  };
}

class Operation {
  Operation({
    this.httpMethod,
    this.nickname,
    this.responseClass,
    this.notes,
    this.id,
    this.errorResponses,
    this.parameters,
    this.summary,
  });

  HttpMethod? httpMethod;
  String? nickname;
  Id? responseClass;
  String? notes;
  String? id;
  List<ErrorResponse>? errorResponses;
  List<Parameter>? parameters;
  String? summary;

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
    httpMethod: httpMethodValues.map[json["httpMethod"]],
    nickname: json["nickname"],
    responseClass: idValues.map[json["responseClass"]],
    notes: json["notes"],
    id: json["_id"],
    errorResponses: List<ErrorResponse>.from(json["errorResponses"].map((x) => ErrorResponse.fromJson(x))),
    parameters: List<Parameter>.from(json["parameters"].map((x) => Parameter.fromJson(x))),
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "httpMethod": httpMethodValues.reverse![httpMethod],
    "nickname": nickname,
    "responseClass": idValues.reverse![responseClass],
    "notes": notes,
    "_id": id,
    "errorResponses": List<dynamic>.from(errorResponses!.map((x) => x.toJson())),
    "parameters": List<dynamic>.from(parameters!.map((x) => x.toJson())),
    "summary": summary,
  };
}

class ErrorResponse {
  ErrorResponse({
    this.code,
    this.reason,
    this.id,
  });

  int? code;
  Reason? reason;
  String? id;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    code: json["code"],
    reason: reasonValues.map[json["reason"]],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "reason": reasonValues.reverse![reason],
    "_id": id,
  };
}

enum Reason { LIMIT_GREATER_THAN_100, LIMIT_INVALID_OR_BELOW_1, INVALID_OR_UNRECOGNIZED_PARAMETER, EMPTY_PARAMETER, INVALID_OR_UNRECOGNIZED_ORDERING_PARAMETER, TOO_MANY_VALUES_SENT_TO_A_MULTI_VALUE_LIST_FILTER, INVALID_VALUE_PASSED_TO_FILTER, CHARACTER_NOT_FOUND, COMIC_NOT_FOUND, CREATOR_NOT_FOUND, EVENT_NOT_FOUND, SERIES_NOT_FOUND, STORY_NOT_FOUND }

final reasonValues = EnumValues({
  "Character not found.": Reason.CHARACTER_NOT_FOUND,
  "Comic not found.": Reason.COMIC_NOT_FOUND,
  "Creator not found.": Reason.CREATOR_NOT_FOUND,
  "Empty parameter.": Reason.EMPTY_PARAMETER,
  "Event not found.": Reason.EVENT_NOT_FOUND,
  "Invalid or unrecognized ordering parameter.": Reason.INVALID_OR_UNRECOGNIZED_ORDERING_PARAMETER,
  "Invalid or unrecognized parameter.": Reason.INVALID_OR_UNRECOGNIZED_PARAMETER,
  "Invalid value passed to filter.": Reason.INVALID_VALUE_PASSED_TO_FILTER,
  "Limit greater than 100.": Reason.LIMIT_GREATER_THAN_100,
  "Limit invalid or below 1.": Reason.LIMIT_INVALID_OR_BELOW_1,
  "Series not found.": Reason.SERIES_NOT_FOUND,
  "Story not found.": Reason.STORY_NOT_FOUND,
  "Too many values sent to a multi-value list filter.": Reason.TOO_MANY_VALUES_SENT_TO_A_MULTI_VALUE_LIST_FILTER
});

enum HttpMethod { GET }

final httpMethodValues = EnumValues({
  "GET": HttpMethod.GET
});

class Parameter {
  Parameter({
    this.name,
    this.description,
    this.dataType,
    this.paramType,
    this.id,
    this.allowMultiple,
    this.required,
    this.allowableValues,
  });

  String? name;
  String? description;
  DataType? dataType;
  ParamType? paramType;
  String? id;
  bool? allowMultiple;
  bool? required;
  AllowableValues? allowableValues;

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
    name: json["name"],
    description: json["description"],
    dataType: dataTypeValues.map[json["dataType"]],
    paramType: paramTypeValues.map[json["paramType"]],
    id: json["_id"],
    allowMultiple: json["allowMultiple"],
    required: json["required"],
    allowableValues: json["allowableValues"] == null ? null : AllowableValues.fromJson(json["allowableValues"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "dataType": dataTypeValues.reverse![dataType],
    "paramType": paramTypeValues.reverse![paramType],
    "_id": id,
    "allowMultiple": allowMultiple,
    "required": required,
    "allowableValues": allowableValues == null ? null : allowableValues!.toJson(),
  };
}

class AllowableValues {
  AllowableValues({
    this.valueType,
    this.id,
    this.values,
    this.min,
    this.max,
  });

  ValueType? valueType;
  String? id;
  List<String>? values;
  int? min;
  int? max;

  factory AllowableValues.fromJson(Map<String, dynamic> json) => AllowableValues(
    valueType: valueTypeValues.map[json["valueType"]],
    id: json["_id"],
    values: List<String>.from(json["values"].map((x) => x)),
    min: json["min"] == null ? null : json["min"],
    max: json["max"] == null ? null : json["max"],
  );

  Map<String, dynamic> toJson() => {
    "valueType": valueTypeValues.reverse![valueType],
    "_id": id,
    "values": List<dynamic>.from(values!.map((x) => x)),
    "min": min == null ? null : min,
    "max": max == null ? null : max,
  };
}

enum ValueType { LIST, RANGE }

final valueTypeValues = EnumValues({
  "LIST": ValueType.LIST,
  "RANGE": ValueType.RANGE
});

enum DataType { STRING, DATE, INT, BOOLEAN }

final dataTypeValues = EnumValues({
  "boolean": DataType.BOOLEAN,
  "Date": DataType.DATE,
  "int": DataType.INT,
  "string": DataType.STRING
});

enum ParamType { QUERY, PATH }

final paramTypeValues = EnumValues({
  "path": ParamType.PATH,
  "query": ParamType.QUERY
});

enum Id { CHARACTER_DATA_WRAPPER, COMIC_DATA_WRAPPER, EVENT_DATA_WRAPPER, SERIES_DATA_WRAPPER, STORY_DATA_WRAPPER, CREATOR_DATA_WRAPPER }

final idValues = EnumValues({
  "CharacterDataWrapper": Id.CHARACTER_DATA_WRAPPER,
  "ComicDataWrapper": Id.COMIC_DATA_WRAPPER,
  "CreatorDataWrapper": Id.CREATOR_DATA_WRAPPER,
  "EventDataWrapper": Id.EVENT_DATA_WRAPPER,
  "SeriesDataWrapper": Id.SERIES_DATA_WRAPPER,
  "StoryDataWrapper": Id.STORY_DATA_WRAPPER
});

class Models {
  Models({
    this.comicList,
    this.eventList,
    this.creatorList,
    this.characterList,
    this.seriesList,
    this.storyList,
    this.characterSummary,
    this.eventSummary,
    this.seriesSummary,
    this.comicSummary,
    this.url,
    this.creatorSummary,
    this.storySummary,
    this.photo,
    this.comicDate,
    this.characterDataContainer,
    this.eventDataContainer,
    this.comicPrice,
    this.eventDataWrapper,
    this.creator,
    this.event,
    this.comicDataContainer,
    this.textObject,
    this.creatorDataWrapper,
    this.storyDataWrapper,
    this.character,
    this.characterDataWrapper,
    this.comicDataWrapper,
    this.series,
    this.seriesDataWrapper,
    this.seriesDataContainer,
    this.storyDataContainer,
    this.comic,
    this.creatorDataContainer,
    this.story,
  });

  CharacterListClass? comicList;
  CharacterListClass? eventList;
  CharacterListClass? creatorList;
  CharacterListClass? characterList;
  CharacterListClass? seriesList;
  CharacterListClass? storyList;
  RSummary? characterSummary;
  Summary? eventSummary;
  Summary? seriesSummary;
  Summary? comicSummary;
  Url? url;
  RSummary? creatorSummary;
  StorySummary? storySummary;
  Photo? photo;
  ComicDate? comicDate;
  DataContainer? characterDataContainer;
  DataContainer? eventDataContainer;
  ComicPrice? comicPrice;
  DataWrapper? eventDataWrapper;
  Creator? creator;
  Event? event;
  DataContainer? comicDataContainer;
  TextObject? textObject;
  DataWrapper? creatorDataWrapper;
  DataWrapper? storyDataWrapper;
  Character? character;
  DataWrapper? characterDataWrapper;
  DataWrapper? comicDataWrapper;
  Event? series;
  DataWrapper? seriesDataWrapper;
  DataContainer? seriesDataContainer;
  DataContainer? storyDataContainer;
  Comic? comic;
  DataContainer? creatorDataContainer;
  Story? story;

  factory Models.fromJson(Map<String, dynamic> json) => Models(
    comicList: CharacterListClass.fromJson(json["ComicList"]),
    eventList: CharacterListClass.fromJson(json["EventList"]),
    creatorList: CharacterListClass.fromJson(json["CreatorList"]),
    characterList: CharacterListClass.fromJson(json["CharacterList"]),
    seriesList: CharacterListClass.fromJson(json["SeriesList"]),
    storyList: CharacterListClass.fromJson(json["StoryList"]),
    characterSummary: RSummary.fromJson(json["CharacterSummary"]),
    eventSummary: Summary.fromJson(json["EventSummary"]),
    seriesSummary: Summary.fromJson(json["SeriesSummary"]),
    comicSummary: Summary.fromJson(json["ComicSummary"]),
    url: Url.fromJson(json["Url"]),
    creatorSummary: RSummary.fromJson(json["CreatorSummary"]),
    storySummary: StorySummary.fromJson(json["StorySummary"]),
    photo: Photo.fromJson(json["Image"]),
    comicDate: ComicDate.fromJson(json["ComicDate"]),
    characterDataContainer: DataContainer.fromJson(json["CharacterDataContainer"]),
    eventDataContainer: DataContainer.fromJson(json["EventDataContainer"]),
    comicPrice: ComicPrice.fromJson(json["ComicPrice"]),
    eventDataWrapper: DataWrapper.fromJson(json["EventDataWrapper"]),
    creator: Creator.fromJson(json["Creator"]),
    event: Event.fromJson(json["Event"]),
    comicDataContainer: DataContainer.fromJson(json["ComicDataContainer"]),
    textObject: TextObject.fromJson(json["TextObject"]),
    creatorDataWrapper: DataWrapper.fromJson(json["CreatorDataWrapper"]),
    storyDataWrapper: DataWrapper.fromJson(json["StoryDataWrapper"]),
    character: Character.fromJson(json["Character"]),
    characterDataWrapper: DataWrapper.fromJson(json["CharacterDataWrapper"]),
    comicDataWrapper: DataWrapper.fromJson(json["ComicDataWrapper"]),
    series: Event.fromJson(json["Series"]),
    seriesDataWrapper: DataWrapper.fromJson(json["SeriesDataWrapper"]),
    seriesDataContainer: DataContainer.fromJson(json["SeriesDataContainer"]),
    storyDataContainer: DataContainer.fromJson(json["StoryDataContainer"]),
    comic: Comic.fromJson(json["Comic"]),
    creatorDataContainer: DataContainer.fromJson(json["CreatorDataContainer"]),
    story: Story.fromJson(json["Story"]),
  );

  Map<String, dynamic> toJson() => {
    "ComicList": comicList!.toJson(),
    "EventList": eventList!.toJson(),
    "CreatorList": creatorList!.toJson(),
    "CharacterList": characterList!.toJson(),
    "SeriesList": seriesList!.toJson(),
    "StoryList": storyList!.toJson(),
    "CharacterSummary": characterSummary!.toJson(),
    "EventSummary": eventSummary!.toJson(),
    "SeriesSummary": seriesSummary!.toJson(),
    "ComicSummary": comicSummary!.toJson(),
    "Url": url!.toJson(),
    "CreatorSummary": creatorSummary!.toJson(),
    "StorySummary": storySummary!.toJson(),
    "Photo": photo!.toJson(),
    "ComicDate": comicDate!.toJson(),
    "CharacterDataContainer": characterDataContainer!.toJson(),
    "EventDataContainer": eventDataContainer!.toJson(),
    "ComicPrice": comicPrice!.toJson(),
    "EventDataWrapper": eventDataWrapper!.toJson(),
    "Creator": creator!.toJson(),
    "Event": event!.toJson(),
    "ComicDataContainer": comicDataContainer!.toJson(),
    "TextObject": textObject!.toJson(),
    "CreatorDataWrapper": creatorDataWrapper!.toJson(),
    "StoryDataWrapper": storyDataWrapper!.toJson(),
    "Character": character!.toJson(),
    "CharacterDataWrapper": characterDataWrapper!.toJson(),
    "ComicDataWrapper": comicDataWrapper!.toJson(),
    "Series": series!.toJson(),
    "SeriesDataWrapper": seriesDataWrapper!.toJson(),
    "SeriesDataContainer": seriesDataContainer!.toJson(),
    "StoryDataContainer": storyDataContainer!.toJson(),
    "Comic": comic!.toJson(),
    "CreatorDataContainer": creatorDataContainer!.toJson(),
    "Story": story!.toJson(),
  };
}

class Character {
  Character({
    this.id,
    this.properties,
  });

  String? id;
  CharacterProperties? properties;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    properties: CharacterProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class CharacterProperties {
  CharacterProperties({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceUri,
    this.urls,
    this.thumbnail,
    this.comics,
    this.stories,
    this.events,
    this.series,
  });

  Comics? id;
  Comics? name;
  Comics? description;
  Comics? modified;
  Comics? resourceUri;
  Urls? urls;
  Comics? thumbnail;
  Comics? comics;
  Comics? stories;
  Comics? events;
  Comics? series;

  factory CharacterProperties.fromJson(Map<String, dynamic> json) => CharacterProperties(
    id: Comics.fromJson(json["id"]),
    name: Comics.fromJson(json["name"]),
    description: Comics.fromJson(json["description"]),
    modified: Comics.fromJson(json["modified"]),
    resourceUri: Comics.fromJson(json["resourceURI"]),
    urls: Urls.fromJson(json["urls"]),
    thumbnail: Comics.fromJson(json["thumbnail"]),
    comics: Comics.fromJson(json["comics"]),
    stories: Comics.fromJson(json["stories"]),
    events: Comics.fromJson(json["events"]),
    series: Comics.fromJson(json["series"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id!.toJson(),
    "name": name!.toJson(),
    "description": description!.toJson(),
    "modified": modified!.toJson(),
    "resourceURI": resourceUri!.toJson(),
    "urls": urls!.toJson(),
    "thumbnail": thumbnail!.toJson(),
    "comics": comics!.toJson(),
    "stories": stories!.toJson(),
    "events": events!.toJson(),
    "series": series!.toJson(),
  };
}

class Comics {
  Comics({
    this.type,
    this.description,
  });

  String? type;
  String? description;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
    type: json["type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "description": description,
  };
}

class Urls {
  Urls({
    this.type,
    this.description,
    this.items,
  });

  Type? type;
  String? description;
  Items? items;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    type: typeValues.map[json["type"]],
    description: json["description"],
    items: Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse![type],
    "description": description,
    "items": items!.toJson(),
  };
}

class Items {
  Items({
    this.ref,
  });

  String? ref;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    ref: json["\u0024ref"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024ref": ref,
  };
}

enum Type { ARRAY }

final typeValues = EnumValues({
  "Array": Type.ARRAY
});

class DataContainer {
  DataContainer({
    this.id,
    this.properties,
  });

  String? id;
  CharacterDataContainerProperties? properties;

  factory DataContainer.fromJson(Map<String, dynamic> json) => DataContainer(
    id: json["id"],
    properties: CharacterDataContainerProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class CharacterDataContainerProperties {
  CharacterDataContainerProperties({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  Comics? offset;
  Comics? limit;
  Comics? total;
  Comics? count;
  Urls? results;

  factory CharacterDataContainerProperties.fromJson(Map<String, dynamic> json) => CharacterDataContainerProperties(
    offset: Comics.fromJson(json["offset"]),
    limit: Comics.fromJson(json["limit"]),
    total: Comics.fromJson(json["total"]),
    count: Comics.fromJson(json["count"]),
    results: Urls.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset!.toJson(),
    "limit": limit!.toJson(),
    "total": total!.toJson(),
    "count": count!.toJson(),
    "results": results!.toJson(),
  };
}

class DataWrapper {
  DataWrapper({
    this.id,
    this.properties,
  });

  Id? id;
  CharacterDataWrapperProperties? properties;

  factory DataWrapper.fromJson(Map<String, dynamic> json) => DataWrapper(
    id: idValues.map[json["id"]],
    properties: CharacterDataWrapperProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse![id],
    "properties": properties!.toJson(),
  };
}

class CharacterDataWrapperProperties {
  CharacterDataWrapperProperties({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.data,
    this.etag,
  });

  Comics? code;
  Comics? status;
  Comics? copyright;
  Comics? attributionText;
  Comics? attributionHtml;
  Comics? data;
  Comics? etag;

  factory CharacterDataWrapperProperties.fromJson(Map<String, dynamic> json) => CharacterDataWrapperProperties(
    code: Comics.fromJson(json["code"]),
    status: Comics.fromJson(json["status"]),
    copyright: Comics.fromJson(json["copyright"]),
    attributionText: Comics.fromJson(json["attributionText"]),
    attributionHtml: Comics.fromJson(json["attributionHTML"]),
    data: Comics.fromJson(json["data"]),
    etag: Comics.fromJson(json["etag"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code!.toJson(),
    "status": status!.toJson(),
    "copyright": copyright!.toJson(),
    "attributionText": attributionText!.toJson(),
    "attributionHTML": attributionHtml!.toJson(),
    "data": data!.toJson(),
    "etag": etag!.toJson(),
  };
}

class CharacterListClass {
  CharacterListClass({
    this.id,
    this.properties,
  });

  String? id;
  CharacterListProperties? properties;

  factory CharacterListClass.fromJson(Map<String, dynamic> json) => CharacterListClass(
    id: json["id"],
    properties: CharacterListProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class CharacterListProperties {
  CharacterListProperties({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  Comics? available;
  Comics? returned;
  Comics? collectionUri;
  Urls? items;

  factory CharacterListProperties.fromJson(Map<String, dynamic> json) => CharacterListProperties(
    available: Comics.fromJson(json["available"]),
    returned: Comics.fromJson(json["returned"]),
    collectionUri: Comics.fromJson(json["collectionURI"]),
    items: Urls.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "available": available!.toJson(),
    "returned": returned!.toJson(),
    "collectionURI": collectionUri!.toJson(),
    "items": items!.toJson(),
  };
}

class RSummary {
  RSummary({
    this.id,
    this.properties,
  });

  String? id;
  CharacterSummaryProperties? properties;

  factory RSummary.fromJson(Map<String, dynamic> json) => RSummary(
    id: json["id"],
    properties: CharacterSummaryProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class CharacterSummaryProperties {
  CharacterSummaryProperties({
    this.resourceUri,
    this.name,
    this.role,
  });

  Comics? resourceUri;
  Comics? name;
  Comics? role;

  factory CharacterSummaryProperties.fromJson(Map<String, dynamic> json) => CharacterSummaryProperties(
    resourceUri: Comics.fromJson(json["resourceURI"]),
    name: Comics.fromJson(json["name"]),
    role: Comics.fromJson(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri!.toJson(),
    "name": name!.toJson(),
    "role": role!.toJson(),
  };
}

class Comic {
  Comic({
    this.id,
    this.properties,
  });

  String? id;
  ComicProperties? properties;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
    id: json["id"],
    properties: ComicProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class ComicProperties {
  ComicProperties({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  Comics? id;
  Comics? digitalId;
  Comics? title;
  Comics? issueNumber;
  Comics? variantDescription;
  Comics? description;
  Comics? modified;
  Comics? isbn;
  Comics? upc;
  Comics? diamondCode;
  Comics? ean;
  Comics? issn;
  Comics? format;
  Comics? pageCount;
  Urls? textObjects;
  Comics? resourceUri;
  Urls? urls;
  Comics? series;
  Urls? variants;
  Urls? collections;
  Urls? collectedIssues;
  Urls? dates;
  Urls? prices;
  Comics? thumbnail;
  Urls? images;
  Comics? creators;
  Comics? characters;
  Comics? stories;
  Comics? events;

  factory ComicProperties.fromJson(Map<String, dynamic> json) => ComicProperties(
    id: Comics.fromJson(json["id"]),
    digitalId: Comics.fromJson(json["digitalId"]),
    title: Comics.fromJson(json["title"]),
    issueNumber: Comics.fromJson(json["issueNumber"]),
    variantDescription: Comics.fromJson(json["variantDescription"]),
    description: Comics.fromJson(json["description"]),
    modified: Comics.fromJson(json["modified"]),
    isbn: Comics.fromJson(json["isbn"]),
    upc: Comics.fromJson(json["upc"]),
    diamondCode: Comics.fromJson(json["diamondCode"]),
    ean: Comics.fromJson(json["ean"]),
    issn: Comics.fromJson(json["issn"]),
    format: Comics.fromJson(json["format"]),
    pageCount: Comics.fromJson(json["pageCount"]),
    textObjects: Urls.fromJson(json["textObjects"]),
    resourceUri: Comics.fromJson(json["resourceURI"]),
    urls: Urls.fromJson(json["urls"]),
    series: Comics.fromJson(json["series"]),
    variants: Urls.fromJson(json["variants"]),
    collections: Urls.fromJson(json["collections"]),
    collectedIssues: Urls.fromJson(json["collectedIssues"]),
    dates: Urls.fromJson(json["dates"]),
    prices: Urls.fromJson(json["prices"]),
    thumbnail: Comics.fromJson(json["thumbnail"]),
    images: Urls.fromJson(json["images"]),
    creators: Comics.fromJson(json["creators"]),
    characters: Comics.fromJson(json["characters"]),
    stories: Comics.fromJson(json["stories"]),
    events: Comics.fromJson(json["events"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id!.toJson(),
    "digitalId": digitalId!.toJson(),
    "title": title!.toJson(),
    "issueNumber": issueNumber!.toJson(),
    "variantDescription": variantDescription!.toJson(),
    "description": description!.toJson(),
    "modified": modified!.toJson(),
    "isbn": isbn!.toJson(),
    "upc": upc!.toJson(),
    "diamondCode": diamondCode!.toJson(),
    "ean": ean!.toJson(),
    "issn": issn!.toJson(),
    "format": format!.toJson(),
    "pageCount": pageCount!.toJson(),
    "textObjects": textObjects!.toJson(),
    "resourceURI": resourceUri!.toJson(),
    "urls": urls!.toJson(),
    "series": series!.toJson(),
    "variants": variants!.toJson(),
    "collections": collections!.toJson(),
    "collectedIssues": collectedIssues!.toJson(),
    "dates": dates!.toJson(),
    "prices": prices!.toJson(),
    "thumbnail": thumbnail!.toJson(),
    "images": images!.toJson(),
    "creators": creators!.toJson(),
    "characters": characters!.toJson(),
    "stories": stories!.toJson(),
    "events": events!.toJson(),
  };
}

class ComicDate {
  ComicDate({
    this.id,
    this.properties,
  });

  String? id;
  ComicDateProperties? properties;

  factory ComicDate.fromJson(Map<String, dynamic> json) => ComicDate(
    id: json["id"],
    properties: ComicDateProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties?.toJson(),
  };
}

class ComicDateProperties {
  ComicDateProperties({
    this.type,
    this.date,
  });

  Comics? type;
  Comics? date;

  factory ComicDateProperties.fromJson(Map<String, dynamic> json) => ComicDateProperties(
    type: Comics.fromJson(json["type"]),
    date: Comics.fromJson(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type!.toJson(),
    "date": date!.toJson(),
  };
}

class ComicPrice {
  ComicPrice({
    this.id,
    this.properties,
  });

  String? id;
  ComicPriceProperties? properties;

  factory ComicPrice.fromJson(Map<String, dynamic> json) => ComicPrice(
    id: json["id"],
    properties: ComicPriceProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class ComicPriceProperties {
  ComicPriceProperties({
    this.type,
    this.price,
  });

  Comics? type;
  Comics? price;

  factory ComicPriceProperties.fromJson(Map<String, dynamic> json) => ComicPriceProperties(
    type: Comics.fromJson(json["type"]),
    price: Comics.fromJson(json["price"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type!.toJson(),
    "price": price!.toJson(),
  };
}

class Summary {
  Summary({
    this.id,
    this.properties,
  });

  String? id;
  ComicSummaryProperties? properties;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    id: json["id"],
    properties: ComicSummaryProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class ComicSummaryProperties {
  ComicSummaryProperties({
    this.resourceUri,
    this.name,
  });

  Comics? resourceUri;
  Comics? name;

  factory ComicSummaryProperties.fromJson(Map<String, dynamic> json) => ComicSummaryProperties(
    resourceUri: Comics.fromJson(json["resourceURI"]),
    name: Comics.fromJson(json["name"]),
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri!.toJson(),
    "name": name!.toJson(),
  };
}

class Creator {
  Creator({
    this.id,
    this.properties,
  });

  String? id;
  CreatorProperties? properties;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    id: json["id"],
    properties: CreatorProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class CreatorProperties {
  CreatorProperties({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffix,
    this.fullName,
    this.modified,
    this.resourceUri,
    this.urls,
    this.thumbnail,
    this.series,
    this.stories,
    this.comics,
    this.events,
  });

  Comics? id;
  Comics? firstName;
  Comics? middleName;
  Comics? lastName;
  Comics? suffix;
  Comics? fullName;
  Comics? modified;
  Comics? resourceUri;
  Urls? urls;
  Comics? thumbnail;
  Comics? series;
  Comics? stories;
  Comics? comics;
  Comics? events;

  factory CreatorProperties.fromJson(Map<String, dynamic> json) => CreatorProperties(
    id: Comics.fromJson(json["id"]),
    firstName: Comics.fromJson(json["firstName"]),
    middleName: Comics.fromJson(json["middleName"]),
    lastName: Comics.fromJson(json["lastName"]),
    suffix: Comics.fromJson(json["suffix"]),
    fullName: Comics.fromJson(json["fullName"]),
    modified: Comics.fromJson(json["modified"]),
    resourceUri: Comics.fromJson(json["resourceURI"]),
    urls: Urls.fromJson(json["urls"]),
    thumbnail: Comics.fromJson(json["thumbnail"]),
    series: Comics.fromJson(json["series"]),
    stories: Comics.fromJson(json["stories"]),
    comics: Comics.fromJson(json["comics"]),
    events: Comics.fromJson(json["events"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id!.toJson(),
    "firstName": firstName!.toJson(),
    "middleName": middleName!.toJson(),
    "lastName": lastName!.toJson(),
    "suffix": suffix!.toJson(),
    "fullName": fullName!.toJson(),
    "modified": modified!.toJson(),
    "resourceURI": resourceUri!.toJson(),
    "urls": urls!.toJson(),
    "thumbnail": thumbnail!.toJson(),
    "series": series!.toJson(),
    "stories": stories!.toJson(),
    "comics": comics!.toJson(),
    "events": events!.toJson(),
  };
}

class Event {
  Event({
    this.id,
    this.properties,
  });

  String? id;
  EventProperties? properties;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    properties: EventProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties?.toJson(),
  };
}

class EventProperties {
  EventProperties({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.comics,
    this.stories,
    this.series,
    this.characters,
    this.creators,
    this.next,
    this.previous,
    this.startYear,
    this.endYear,
    this.rating,
    this.events,
  });

  Comics? id;
  Comics? title;
  Comics? description;
  Comics? resourceUri;
  Urls? urls;
  Comics? modified;
  Comics? start;
  Comics? end;
  Comics? thumbnail;
  Comics? comics;
  Comics? stories;
  Comics? series;
  Comics? characters;
  Comics? creators;
  Comics? next;
  Comics? previous;
  Comics? startYear;
  Comics? endYear;
  Comics? rating;
  Comics? events;

  factory EventProperties.fromJson(Map<String, dynamic> json) => EventProperties(
    id: Comics.fromJson(json["id"]),
    title: Comics.fromJson(json["title"]),
    description: Comics.fromJson(json["description"]),
    resourceUri: Comics.fromJson(json["resourceURI"]),
    urls: Urls.fromJson(json["urls"]),
    modified: Comics.fromJson(json["modified"]),
    start: json["start"] == null ? null : Comics.fromJson(json["start"]),
    end: json["end"] == null ? null : Comics.fromJson(json["end"]),
    thumbnail: Comics.fromJson(json["thumbnail"]),
    comics: Comics.fromJson(json["comics"]),
    stories: Comics.fromJson(json["stories"]),
    series: json["series"] == null ? null : Comics.fromJson(json["series"]),
    characters: Comics.fromJson(json["characters"]),
    creators: Comics.fromJson(json["creators"]),
    next: Comics.fromJson(json["next"]),
    previous: Comics.fromJson(json["previous"]),
    startYear: json["startYear"] == null ? null : Comics.fromJson(json["startYear"]),
    endYear: json["endYear"] == null ? null : Comics.fromJson(json["endYear"]),
    rating: json["rating"] == null ? null : Comics.fromJson(json["rating"]),
    events: json["events"] == null ? null : Comics.fromJson(json["events"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id!.toJson(),
    "title": title!.toJson(),
    "description": description!.toJson(),
    "resourceURI": resourceUri!.toJson(),
    "urls": urls!.toJson(),
    "modified": modified!.toJson(),
    "start": start == null ? null : start!.toJson(),
    "end": end == null ? null : end!.toJson(),
    "thumbnail": thumbnail!.toJson(),
    "comics": comics!.toJson(),
    "stories": stories!.toJson(),
    "series": series == null ? null : series!.toJson(),
    "characters": characters!.toJson(),
    "creators": creators!.toJson(),
    "next": next!.toJson(),
    "previous": previous!.toJson(),
    "startYear": startYear == null ? null : startYear!.toJson(),
    "endYear": endYear == null ? null : endYear!.toJson(),
    "rating": rating == null ? null : rating!.toJson(),
    "events": events == null ? null : events!.toJson(),
  };
}

class Photo {
  Photo({
    this.id,
    this.properties,
  });

  String? id;
  ImageProperties? properties;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    properties: ImageProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class ImageProperties {
  ImageProperties({
    this.path,
    this.extension,
  });

  Comics? path;
  Comics? extension;

  factory ImageProperties.fromJson(Map<String, dynamic> json) => ImageProperties(
    path: Comics.fromJson(json["path"]),
    extension: Comics.fromJson(json["extension"]),
  );

  Map<String, dynamic> toJson() => {
    "path": path!.toJson(),
    "extension": extension!.toJson(),
  };
}

class Story {
  Story({
    this.id,
    this.properties,
  });

  String? id;
  Map<String, Comics>? properties;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["id"],
    properties: Map.from(json["properties"]).map((k, v) => MapEntry<String, Comics>(k, Comics.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": Map.from(properties!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class StorySummary {
  StorySummary({
    this.id,
    this.properties,
  });

  String? id;
  StorySummaryProperties? properties;

  factory StorySummary.fromJson(Map<String, dynamic> json) => StorySummary(
    id: json["id"],
    properties: StorySummaryProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class StorySummaryProperties {
  StorySummaryProperties({
    this.resourceUri,
    this.name,
    this.type,
  });

  Comics? resourceUri;
  Comics? name;
  Comics? type;

  factory StorySummaryProperties.fromJson(Map<String, dynamic> json) => StorySummaryProperties(
    resourceUri: Comics.fromJson(json["resourceURI"]),
    name: Comics.fromJson(json["name"]),
    type: Comics.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri!.toJson(),
    "name": name!.toJson(),
    "type": type!.toJson(),
  };
}

class TextObject {
  TextObject({
    this.id,
    this.properties,
  });

  String? id;
  TextObjectProperties? properties;

  factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
    id: json["id"],
    properties: TextObjectProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class TextObjectProperties {
  TextObjectProperties({
    this.type,
    this.language,
    this.text,
  });

  Comics? type;
  Comics? language;
  Comics? text;

  factory TextObjectProperties.fromJson(Map<String, dynamic> json) => TextObjectProperties(
    type: Comics.fromJson(json["type"]),
    language: Comics.fromJson(json["language"]),
    text: Comics.fromJson(json["text"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type!.toJson(),
    "language": language!.toJson(),
    "text": text!.toJson(),
  };
}

class Url {
  Url({
    this.id,
    this.properties,
  });

  String? id;
  UrlProperties? properties;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    id: json["id"],
    properties: UrlProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "properties": properties!.toJson(),
  };
}

class UrlProperties {
  UrlProperties({
    this.type,
    this.url,
  });

  Comics? type;
  Comics? url;

  factory UrlProperties.fromJson(Map<String, dynamic> json) => UrlProperties(
    type: Comics.fromJson(json["type"]),
    url: Comics.fromJson(json["url"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type!.toJson(),
    "url": url!.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
