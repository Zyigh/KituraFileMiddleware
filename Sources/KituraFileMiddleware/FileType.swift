//
//  MimeType.swift
//  KituraFileMiddleware
//
//  Created by Hugo Medina on 08/02/2020.
//

import Foundation

public struct File: Codable {
    let name: String?
    let data: Data?
    var storageName: String? = nil
    var fileType: FileType? = nil
}

public struct FileType: Codable {
    let ext: FileExtension
    let mimeType: MimeType
}

public enum FileExtension: String, Codable {
    case aac, abw, arc, avi, azw, bin, bz, bz2, csh, css, csv, doc, docx, eot,
        epub, gif, htm, html, ico, ics, jar, jpeg, jpg, js, json, mid, midi, mpeg,
        mpkg, odp, ods, odt, oga, ogv, ogx, otf, png, pdf, ppt, pptx, rar, rtf,
        sh, svg, swf, tar, tif, tiff, ts, ttf, vsd, wav, weba, webm, webp, woff,
        woff2, xhtml, xls, xlsx, xml, xul, zip, unknown
}

public enum MimeType: String, Codable {
    case aac = "audio/aac"
    case abw = "application/x-abiword"
    case avi = "video/x-msvideo"
    case azw = "application/vnd.amazon.ebook"
    case bin = "application/octet-stream"
    case bz = "application/x-bzip"
    case bz2 = "application/x-bzip2"
    case csh = "application/x-csh"
    case css = "text/css"
    case csv = "text/csv"
    case doc = "application/msword"
    case docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    case eot = "application/vnd.ms-fontobject"
    case epub = "application/epub+zip"
    case gif = "image/gif"
    case html = "text/html"
    case ico = "image/x-icon"
    case ics = "text/calendar"
    case jar = "application/java-archive"
    case jpg = "image/jpeg"
    case js = "application/javascript"
    case json = "application/json"
    case mid = "audio/midi    "
    case midi = "audio/midi"
    case mpeg = "video/mpeg"
    case mpkg = "application/vnd.apple.installer+xml"
    case odp = "application/vnd.oasis.opendocument.presentation"
    case ods = "application/vnd.oasis.opendocument.spreadsheet"
    case odt = "application/vnd.oasis.opendocument.text"
    case oga = "audio/ogg"
    case ogv = "video/ogg"
    case ogx = "application/ogg"
    case otf = "font/otf"
    case png = "image/png"
    case pdf = "application/pdf"
    case ppt = "application/vnd.ms-powerpoint"
    case pptx = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    case rar = "application/x-rar-compressed"
    case rtf = "application/rtf"
    case sh = "application/x-sh"
    case svg = "image/svg+xml"
    case swf = "application/x-shockwave-flash"
    case tar = "application/x-tar"
    case tiff = "image/tiff"
    case ts = "application/typescript"
    case ttf = "font/ttf"
    case vsd = "application/vnd.visio"
    case wav = "audio/x-wav"
    case weba = "audio/webm"
    case webm = "video/webm"
    case webp = "image/webp"
    case woff = "font/woff"
    case woff2 = "font/woff2"
    case xhtml = "application/xhtml+xml"
    case xls = "application/vnd.ms-excel"
    case xlsx = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    case xml = "application/xml"
    case xul = "application/vnd.mozilla.xul+xml"
    case zip = "application/zip"
}
