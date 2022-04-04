//
//  test.swift
//  dia
//
//  Created by Артем  on 08.12.2021.
//
import Foundation
import xlsxwriter

class exportTable {
    func generate() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        let fileURL = documentDirectory.appendingPathComponent("foodTable.xlsx")
        
        let workbook = workbook_new((fileURL.absoluteString.dropFirst(6) as NSString).fileSystemRepresentation)
        let worksheet1 = workbook_add_worksheet(workbook, "Приемы пищи")
        let worksheet2 = workbook_add_worksheet(workbook, "Изменения сахара")
        
        let merge_f = workbook_add_format(workbook);
        format_set_border(merge_f, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        // зеленый - 0xF0FFF0
        // синий - 0xF0F8FF
        
        let merge_format = workbook_add_format(workbook);
        format_set_align(merge_format, UInt8(LXW_ALIGN_VERTICAL_CENTER.rawValue))
        format_set_bg_color(merge_format, 0xF0FFF0)
        format_set_border(merge_format, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        let merge_format_alt = workbook_add_format(workbook);
        format_set_align(merge_format_alt, UInt8(LXW_ALIGN_VERTICAL_CENTER.rawValue))
        format_set_bg_color(merge_format_alt, 0xF0F8FF)
        format_set_border(merge_format_alt, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        let merge_format1 = workbook_add_format(workbook);
        format_set_align(merge_format1, UInt8(LXW_ALIGN_CENTER.rawValue))
        format_set_align(merge_format1, UInt8(LXW_ALIGN_VERTICAL_CENTER.rawValue))
        format_set_bg_color(merge_format1, 0xF0FFF0)
        format_set_border(merge_format1, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        let merge_format_alt1 = workbook_add_format(workbook);
        format_set_align(merge_format_alt1, UInt8(LXW_ALIGN_CENTER.rawValue))
        format_set_align(merge_format_alt1, UInt8(LXW_ALIGN_VERTICAL_CENTER.rawValue))
        format_set_bg_color(merge_format_alt1, 0xF0F8FF)
        format_set_border(merge_format_alt1, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        let merge_format2 = workbook_add_format(workbook);
        format_set_align(merge_format2, UInt8(LXW_ALIGN_DISTRIBUTED.rawValue))
        format_set_align(merge_format2, UInt8(LXW_ALIGN_VERTICAL_CENTER.rawValue))
        format_set_bg_color(merge_format2, 0xF0FFF0)
        format_set_border(merge_format2, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        let merge_format_alt2 = workbook_add_format(workbook);
        format_set_align(merge_format_alt2, UInt8(LXW_ALIGN_DISTRIBUTED.rawValue))
        format_set_align(merge_format_alt2, UInt8(LXW_ALIGN_VERTICAL_CENTER.rawValue))
        format_set_bg_color(merge_format_alt2, 0xF0F8FF)
        format_set_border(merge_format_alt2, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        let merge_format3 = workbook_add_format(workbook)
        format_set_border(merge_format3, UInt8(LXW_BORDER_DOTTED.rawValue))
        format_set_bg_color(merge_format3, 0xFAFAD2)
        format_set_align(merge_format3, UInt8(LXW_ALIGN_LEFT.rawValue))
        format_set_bold(merge_format3)
        
        let merge_format4 = workbook_add_format(workbook)
        format_set_align(merge_format4, UInt8(LXW_ALIGN_DISTRIBUTED.rawValue))
        format_set_align(merge_format4, UInt8(LXW_ALIGN_VERTICAL_TOP.rawValue))
        format_set_bg_color(merge_format4, 0xFAFAD2)
        format_set_border(merge_format4, UInt8(LXW_BORDER_DOTTED.rawValue))
        format_set_bold(merge_format4)
        
        let merge_format41 = workbook_add_format(workbook)
        format_set_align(merge_format41, UInt8(LXW_ALIGN_LEFT.rawValue))
        format_set_align(merge_format41, UInt8(LXW_ALIGN_VERTICAL_TOP.rawValue))
        format_set_bg_color(merge_format41, 0xFAFAD2)
        format_set_border(merge_format41, UInt8(LXW_BORDER_DOTTED.rawValue))
        format_set_bold(merge_format41)
        
        let merge_format42 = workbook_add_format(workbook)
        format_set_align(merge_format42, UInt8(LXW_ALIGN_DISTRIBUTED.rawValue))
        format_set_align(merge_format42, UInt8(LXW_ALIGN_VERTICAL_TOP.rawValue))
        format_set_border(merge_format42, UInt8(LXW_BORDER_DOTTED.rawValue))
        
        let merge_format4_blue = workbook_add_format(workbook)
        format_set_align(merge_format4_blue, UInt8(LXW_ALIGN_DISTRIBUTED.rawValue))
        format_set_align(merge_format4_blue, UInt8(LXW_ALIGN_VERTICAL_TOP.rawValue))
        format_set_bg_color(merge_format4_blue, 0xF1F8FD)
        format_set_font_color(merge_format4_blue, 0x0000F5)
        format_set_border(merge_format4_blue, UInt8(LXW_BORDER_DOTTED.rawValue))
        format_set_bold(merge_format4_blue)
        
        let merge_format4_red = workbook_add_format(workbook)
        format_set_align(merge_format4_red, UInt8(LXW_ALIGN_DISTRIBUTED.rawValue))
        format_set_align(merge_format4_red, UInt8(LXW_ALIGN_VERTICAL_TOP.rawValue))
        format_set_bg_color(merge_format4_red, 0xFCF0F5)
        format_set_font_color(merge_format4_red, 0xEA3424)
        format_set_border(merge_format4_red, UInt8(LXW_BORDER_DOTTED.rawValue))
        format_set_bold(merge_format4_red)
        
        
        worksheet_set_column(worksheet1, 0, 0, 20, nil);
        worksheet_set_column(worksheet1, 1, 1, 10, nil);
        worksheet_set_column(worksheet1, 2, 2, 10, nil);
        worksheet_set_column(worksheet1, 3, 3, 12.5, nil);
        worksheet_set_column(worksheet1, 4, 4, 30, nil);
        worksheet_set_column(worksheet1, 5, 5, 12.5, nil);
        worksheet_set_column(worksheet1, 6, 9, 12.5, nil);
        worksheet_set_column(worksheet1, 10, 11, 21.5, nil);
        worksheet_set_column(worksheet1, 12, 13, 12.5, nil);
        worksheet_set_column(worksheet1, 14, 15, 19.5, nil);
        worksheet_set_column(worksheet1, 16, 24, 12.5, nil);
        worksheet_set_column(worksheet1, 25, 26, 19.5, nil);
        worksheet_set_column(worksheet1, 27, 27, 21.5, nil);
        worksheet_set_column(worksheet1, 28, 34, 19.5, nil);
        
        worksheet_set_column(worksheet2, 0, 0, 20, nil);
        worksheet_set_column(worksheet2, 1, 1, 10, nil);
        
        let tbl = getFoodRecords()
        let userName = getName()
        
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        let formater1 = DateFormatter()
        formater1.dateFormat = "HH:mm"
        
        var listOfIndex: [Int] = []
        for i in 0..<tbl.count {
            listOfIndex.append(tbl[i].food.joined().count)
        }
        var listOfIndex1: [Int] = []
        for i in 0..<tbl.count {
            for i1 in 0..<tbl[i].foodType.count{
                listOfIndex1.append(tbl[i].food[i1].count)
            }
        }
        
        worksheet_merge_range(worksheet1, 0, 0, 0, 34, userName, nil);
        worksheet_merge_range(worksheet1, 1, 0, 1, 34, "Приемы пищи", merge_format3);
        worksheet_write_string(worksheet1, 2, 1, "Дата", merge_format3)
        worksheet_write_string(worksheet1, 2, 2, "Время", merge_format3)
        worksheet_write_string(worksheet1, 2, 3, "Прием пищи", merge_format3)
        worksheet_write_string(worksheet1, 2, 4, "Продукт", merge_format3)
        worksheet_write_string(worksheet1, 2, 5, "Масса, гр.", merge_format3)
        worksheet_write_string(worksheet1, 2, 6, "Углеводы, гр.", merge_format3)
        worksheet_write_string(worksheet1, 2, 7, "Белки, гр.", merge_format3)
        worksheet_write_string(worksheet1, 2, 8, "Жиры, гр.", merge_format3)
        worksheet_write_string(worksheet1, 2, 9, "ККал", merge_format3)
        worksheet_write_string(worksheet1, 2, 10, "Гликемический индекс", merge_format3)
        worksheet_write_string(worksheet1, 2, 11, nil, nil)
        worksheet_write_string(worksheet1, 2, 12, "Вода, в г.", merge_format3)
        worksheet_write_string(worksheet1, 2, 13, "НЖК, в г.", merge_format3)
        worksheet_write_string(worksheet1, 2, 14, "Холестерин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 15, "Пищевые волокна, в г.", merge_format3)
        worksheet_write_string(worksheet1, 2, 16, "Зола, в г.", merge_format3)
        worksheet_write_string(worksheet1, 2, 17, "Натрий, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 18, "Калий, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 19, "Кальций, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 20, "Магний, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 21, "Фосфор, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 22, "Железо, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 23, "Ретинол, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 24, "Тиамин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 25, "Рибофлавин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 26, "Ниацин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 27, "Аскорбиновая кисл., в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 28, "Ретин. экв., в мкг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 29, "Каротин, в мкг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 30, "МДС, в г.", merge_format3)
        worksheet_write_string(worksheet1, 2, 31, "Крахмал, в г.", merge_format3)
        worksheet_write_string(worksheet1, 2, 32, "Токоферол. экв., в мг.", merge_format3)
        worksheet_write_string(worksheet1, 2, 33, "Органическая кисл., в г.", merge_format3)
        worksheet_write_string(worksheet1, 2, 34, "Ниациновый экв., в мг.", merge_format3)
        
        var d = 0
        var r = 0
        var r1 = 0
        var rr = 0
        var kk = 0
        
        for i in 0..<tbl.count {
            worksheet_merge_range(worksheet1, lxw_row_t(listOfIndex[0..<i+1].reduce(0,+)-listOfIndex[i]+3), 1, lxw_row_t(listOfIndex[0..<i+1].reduce(0,+)-1+3), 1, nil, merge_f);
            if kk == i {
                worksheet_write_string(worksheet1, lxw_row_t(d+3), 1, formater.string(from: tbl[i].day), merge_format2)
            } else {
                worksheet_write_string(worksheet1, lxw_row_t(d+3), 1, formater.string(from: tbl[i].day), merge_format_alt2)
                kk = i+1
            }
            d = d + tbl[i].food.joined().count
            for i1 in 0..<tbl[i].time.count {
                worksheet_merge_range(worksheet1, lxw_row_t(r1+3), 2, lxw_row_t(r1+listOfIndex1[rr]-1+3), 2, nil, merge_f);
                if kk == i {
                    worksheet_write_string(worksheet1, lxw_row_t(r1+3), 2, formater1.string(from: tbl[i].time[i1]), merge_format1)
                } else {
                    worksheet_write_string(worksheet1, lxw_row_t(r1+3), 2, formater1.string(from: tbl[i].time[i1]), merge_format_alt1)
                }
                worksheet_merge_range(worksheet1, lxw_row_t(r1+3), 3, lxw_row_t(r1+listOfIndex1[rr]-1+3), 3, nil, merge_f);
                if kk == i {
                    worksheet_write_string(worksheet1, lxw_row_t(r1+3), 3, tbl[i].foodType[i1], merge_format1)
                } else {
                    worksheet_write_string(worksheet1, lxw_row_t(r1+3), 3, tbl[i].foodType[i1], merge_format_alt1)
                }
                r1 = r1 + tbl[i].food[i1].count
                rr += 1
            }
            for j in 0..<tbl[i].food.joined().count {
                if kk == i {
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 4, Array(tbl[i].food.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 5, Array(tbl[i].g.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 6, Array(tbl[i].carbo.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 7, Array(tbl[i].prot.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 8, Array(tbl[i].fat.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 9, Array(tbl[i].ec.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 10, Array(tbl[i].gi.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 11, nil, nil)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 12, Array(tbl[i].water.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 13, Array(tbl[i].nzhk.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 14, Array(tbl[i].hol.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 15, Array(tbl[i].pv.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 16, Array(tbl[i].zola.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 17, Array(tbl[i].na.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 18, Array(tbl[i].k.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 19, Array(tbl[i].ca.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 20, Array(tbl[i].mg.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 21, Array(tbl[i].p.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 22, Array(tbl[i].fe.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 23, Array(tbl[i].a.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 24, Array(tbl[i].b1.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 25, Array(tbl[i].b2.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 26, Array(tbl[i].rr.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 27, Array(tbl[i].c.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 28, Array(tbl[i].re.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 29, Array(tbl[i].kar.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 30, Array(tbl[i].mds.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 31, Array(tbl[i].kr.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 32, Array(tbl[i].te.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 33, Array(tbl[i].ok.joined())[j], merge_format)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 34, Array(tbl[i].ne.joined())[j], merge_format)
                } else {
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 4, Array(tbl[i].food.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 5, Array(tbl[i].g.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 6, Array(tbl[i].carbo.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 7, Array(tbl[i].prot.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 8, Array(tbl[i].fat.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 9, Array(tbl[i].ec.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 10, Array(tbl[i].gi.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 11, nil, nil)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 12, Array(tbl[i].water.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 13, Array(tbl[i].nzhk.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 14, Array(tbl[i].hol.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 15, Array(tbl[i].pv.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 16, Array(tbl[i].zola.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 17, Array(tbl[i].na.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 18, Array(tbl[i].k.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 19, Array(tbl[i].ca.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 20, Array(tbl[i].mg.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 21, Array(tbl[i].p.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 22, Array(tbl[i].fe.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 23, Array(tbl[i].a.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 24, Array(tbl[i].b1.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 25, Array(tbl[i].b2.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 26, Array(tbl[i].rr.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 27, Array(tbl[i].c.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 28, Array(tbl[i].re.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 29, Array(tbl[i].kar.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 30, Array(tbl[i].mds.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 31, Array(tbl[i].kr.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 32, Array(tbl[i].te.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 33, Array(tbl[i].ok.joined())[j], merge_format_alt)
                    worksheet_write_string(worksheet1, lxw_row_t(r+3), 34, Array(tbl[i].ne.joined())[j], merge_format_alt)
                }
                r += 1
            }
        }
        
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+1), 0, "Среднее по дням", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 1, "Дата", merge_format3)
        worksheet_merge_range(worksheet1, lxw_row_t(3+r1+2), 2, lxw_row_t(3+r1+2), 4, nil, merge_format3);
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 5, "Масса, гр.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 6, "Углеводы, гр.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 7, "Белки, гр.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 8, "Жиры, гр.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 9, "ККал", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 10, "Гликемический индекс", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 11, nil, nil)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 12, "Вода, в г.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 13, "НЖК, в г.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 14, "Холестерин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 15, "Пищевые волокна, в г.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 16, "Зола, в г.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 17, "Натрий, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 18, "Калий, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 19, "Кальций, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 20, "Магний, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 21, "Фосфор, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 22, "Железо, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 23, "Ретинол, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 24, "Тиамин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 25, "Рибофлавин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 26, "Ниацин, в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 27, "Аскорбиновая кисл., в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 28, "Ретин. экв., в мкг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 29, "Каротин, в мкг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 30, "МДС, в г.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 31, "Крахмал, в г.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 32, "Токоферол. экв., в мг.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 33, "Органическая кисл., в г.", merge_format3)
        worksheet_write_string(worksheet1, lxw_row_t(3+r1+2), 34, "Ниациновый экв., в мг.", merge_format3)
        
        for i in 0..<tbl.count {
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 1, formater.string(from: tbl[i].day), nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 5, "\(round(Array(tbl[i].g.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].g.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 6, "\(round(Array(tbl[i].carbo.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].carbo.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 7, "\(round(Array(tbl[i].prot.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].prot.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 8, "\(round(Array(tbl[i].fat.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].fat.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 9, "\(round(Array(tbl[i].ec.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].ec.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 10, "\(round(Array(tbl[i].gi.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].gi.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 11, nil, nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 12, "\(round(Array(tbl[i].water.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].water.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 13, "\(round(Array(tbl[i].nzhk.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].nzhk.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 14, "\(round(Array(tbl[i].hol.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].hol.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 15, "\(round(Array(tbl[i].pv.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].pv.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 16, "\(round(Array(tbl[i].zola.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].zola.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 17, "\(round(Array(tbl[i].na.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].na.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 18, "\(round(Array(tbl[i].k.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].k.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 19, "\(round(Array(tbl[i].ca.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].ca.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 20, "\(round(Array(tbl[i].mg.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].mg.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 21, "\(round(Array(tbl[i].p.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].p.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 22, "\(round(Array(tbl[i].fe.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].fe.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 23, "\(round(Array(tbl[i].a.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].a.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 24, "\(round(Array(tbl[i].b1.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].b1.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 25, "\(round(Array(tbl[i].b2.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].b2.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 26, "\(round(Array(tbl[i].rr.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].rr.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 27, "\(round(Array(tbl[i].c.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].c.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 28, "\(round(Array(tbl[i].re.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].re.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 29, "\(round(Array(tbl[i].kar.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].kar.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 30, "\(round(Array(tbl[i].mds.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].mds.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 31, "\(round(Array(tbl[i].kr.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].kr.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 32, "\(round(Array(tbl[i].te.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].te.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 33, "\(round(Array(tbl[i].ok.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].ok.joined().count)*100)/100)", nil)
            worksheet_write_string(worksheet1, lxw_row_t(3+r1+3+i), 34, "\(round(Array(tbl[i].ne.joined()).compactMap(Double.init).reduce(0,+)/Double(tbl[i].ne.joined().count)*100)/100)", nil)
        }
        
        let tbl2 = getSugarRecords()
        
        worksheet_merge_range(worksheet2, 0, 0, 0, 13, userName, nil);
        worksheet_merge_range(worksheet2, 1, 0, 1, 13, "Измерение сахара", merge_format41);
        worksheet_write_string(worksheet2, 2, 1, "Дата", merge_format41);
        worksheet_merge_range(worksheet2, 2, 2, 2, 3, "Натощак", merge_format41);
        worksheet_merge_range(worksheet2, 2, 4, 2, 5, "После завтрака", merge_format41);
        worksheet_merge_range(worksheet2, 2, 6, 2, 7, "После обеда", merge_format41);
        worksheet_merge_range(worksheet2, 2, 8, 2, 9, "После ужина", merge_format41);
        worksheet_merge_range(worksheet2, 2, 10, 2, 11, "Дополнительно", merge_format41);
        worksheet_merge_range(worksheet2, 2, 12, 2, 13, "При родах", merge_format41);
        var i1 = 0
        for i in 0..<tbl2.count {
            worksheet_write_string(worksheet2, lxw_row_t(i1+3), 1, tbl2[i].date, nil)
            // Натощак
            var par = 0
            if (!tbl2[i].natoshak.isEmpty) && (Double(tbl2[i].natoshak[0][0])! >= 7.0) {
                par = 1
            } else if (!tbl2[i].natoshak.isEmpty) && (Double(tbl2[i].natoshak[0][0])! < 7.0) && (Double(tbl2[i].natoshak[0][0])! > 4.0) {
                par = 2
            } else if (!tbl2[i].natoshak.isEmpty) && (Double(tbl2[i].natoshak[0][0])! < 4.0) && (Double(tbl2[i].natoshak[0][0])! > 0.0) {
                par = 3
            } else {
                par = 4
            }
            var natoshak_lvl: [String] = []
            for i2 in 0..<tbl2[i].natoshak.count {
                natoshak_lvl.append(tbl2[i].natoshak[i2][0]+"\t")
            }
            if  par == 1 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 2, natoshak_lvl.joined(separator: "\n") , merge_format4_red)
            } else if par == 2 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 2, natoshak_lvl.joined(separator: "\n") , merge_format4)
            } else if par == 3 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 2, natoshak_lvl.joined(separator: "\n") , merge_format4_blue)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 2, natoshak_lvl.joined(separator: "\n") , nil)
            }
            var natoshak_time: [String] = []
            for i2 in 0..<tbl2[i].natoshak.count {
                natoshak_time.append(tbl2[i].natoshak[i2][1]+"\t")
            }
            if natoshak_time.isEmpty {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 3, natoshak_time.joined(separator: "\n"), nil)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 3, natoshak_time.joined(separator: "\n"), merge_format42)
            }
            // После завтрака
            if (!tbl2[i].zavtrak.isEmpty) && (Double(tbl2[i].zavtrak[0][0])! >= 7.0) {
                par = 1
            } else if (!tbl2[i].zavtrak.isEmpty) && (Double(tbl2[i].zavtrak[0][0])! < 7.0) && (Double(tbl2[i].zavtrak[0][0])! > 4.0) {
                par = 2
            } else if (!tbl2[i].zavtrak.isEmpty) && (Double(tbl2[i].zavtrak[0][0])! < 4.0) && (Double(tbl2[i].zavtrak[0][0])! > 0.0) {
                par = 3
            } else {
                par = 4
            }
            var zavtrak_lvl: [String] = []
            for i2 in 0..<tbl2[i].zavtrak.count {
                zavtrak_lvl.append(tbl2[i].zavtrak[i2][0]+"\t")
            }
            if  par == 1 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 4, zavtrak_lvl.joined(separator: "\n") , merge_format4_red)
            } else if par == 2 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 4, zavtrak_lvl.joined(separator: "\n") , merge_format4)
            } else if par == 3 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 4, zavtrak_lvl.joined(separator: "\n") , merge_format4_blue)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 4, zavtrak_lvl.joined(separator: "\n") , nil)
            }
            var zavtrak_time: [String] = []
            for i2 in 0..<tbl2[i].zavtrak.count {
                zavtrak_time.append(tbl2[i].zavtrak[i2][1]+"\t")
            }
            if zavtrak_time.isEmpty {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 5, zavtrak_time.joined(separator: "\n") , nil)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 5, zavtrak_time.joined(separator: "\n") , merge_format42)
            }
            // После обеда
            if (!tbl2[i].obed.isEmpty) && (Double(tbl2[i].obed[0][0])! >= 7.0) {
                par = 1
            } else if (!tbl2[i].obed.isEmpty) && (Double(tbl2[i].obed[0][0])! < 7.0) && (Double(tbl2[i].obed[0][0])! > 4.0) {
                par = 2
            } else if (!tbl2[i].obed.isEmpty) && (Double(tbl2[i].obed[0][0])! < 4.0) && (Double(tbl2[i].obed[0][0])! > 0.0) {
                par = 3
            } else {
                par = 4
            }
            var obed_lvl: [String] = []
            for i2 in 0..<tbl2[i].obed.count {
                obed_lvl.append(tbl2[i].obed[i2][0]+"\t")
            }
            if  par == 1 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 6, obed_lvl.joined(separator: "\n") , merge_format4_red)
            } else if par == 2 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 6, obed_lvl.joined(separator: "\n") , merge_format4)
            } else if par == 3 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 6, obed_lvl.joined(separator: "\n") , merge_format4_blue)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 6, obed_lvl.joined(separator: "\n") , nil)
            }
            var obed_time: [String] = []
            for i2 in 0..<tbl2[i].obed.count {
                obed_time.append(tbl2[i].obed[i2][1]+"\t")
            }
            if obed_time.isEmpty {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 7, obed_time.joined(separator: "\n") , nil)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 7, obed_time.joined(separator: "\n") , merge_format42)
            }
            // После ужина
            if (!tbl2[i].yzin.isEmpty) && (Double(tbl2[i].yzin[0][0])! >= 7.0) {
                par = 1
            } else if (!tbl2[i].yzin.isEmpty) && (Double(tbl2[i].yzin[0][0])! < 7.0) && (Double(tbl2[i].yzin[0][0])! > 4.0) {
                par = 2
            } else if (!tbl2[i].yzin.isEmpty) && (Double(tbl2[i].yzin[0][0])! < 4.0) && (Double(tbl2[i].yzin[0][0])! > 0.0) {
                par = 3
            } else {
                par = 4
            }
            var yzin_lvl: [String] = []
            for i2 in 0..<tbl2[i].yzin.count {
                yzin_lvl.append(tbl2[i].yzin[i2][0]+"\t")
            }
            if  par == 1 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 8, yzin_lvl.joined(separator: "\n") , merge_format4_red)
            } else if par == 2 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 8, yzin_lvl.joined(separator: "\n") , merge_format4)
            } else if par == 3 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 8, yzin_lvl.joined(separator: "\n") , merge_format4_blue)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 8, yzin_lvl.joined(separator: "\n") , nil)
            }
            var yzin_time: [String] = []
            for i2 in 0..<tbl2[i].yzin.count {
                yzin_time.append(tbl2[i].yzin[i2][1]+"\t")
            }
            if yzin_time.isEmpty {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 9, yzin_time.joined(separator: "\n") , nil)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 9, yzin_time.joined(separator: "\n") , merge_format42)
            }
            // Дополнительно
            if (!tbl2[i].dop.isEmpty) && (Double(tbl2[i].dop[0][0])! >= 7.0) {
                par = 1
            } else if (!tbl2[i].dop.isEmpty) && (Double(tbl2[i].dop[0][0])! < 7.0) && (Double(tbl2[i].dop[0][0])! > 4.0) {
                par = 2
            } else if (!tbl2[i].dop.isEmpty) && (Double(tbl2[i].dop[0][0])! < 4.0) && (Double(tbl2[i].dop[0][0])! > 0.0) {
                par = 3
            } else {
                par = 4
            }
            var dop_lvl: [String] = []
            for i2 in 0..<tbl2[i].dop.count {
                dop_lvl.append(tbl2[i].dop[i2][0]+"\t")
            }
            if  par == 1 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 10, dop_lvl.joined(separator: "\n") , merge_format4_red)
            } else if par == 2 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 10, dop_lvl.joined(separator: "\n") , merge_format4)
            } else if par == 3 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 10, dop_lvl.joined(separator: "\n") , merge_format4_blue)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 10, dop_lvl.joined(separator: "\n") , nil)
            }
            var dop_time: [String] = []
            for i2 in 0..<tbl2[i].dop.count {
                dop_time.append(tbl2[i].dop[i2][1]+"\t")
            }
            if dop_lvl.isEmpty {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 11, dop_time.joined(separator: "\n") , nil)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 11, dop_time.joined(separator: "\n") , merge_format42)
            }
            // При родах
            if (!tbl2[i].rodi.isEmpty) && (Double(tbl2[i].rodi[0][0])! >= 7.0) {
                par = 1
            } else if (!tbl2[i].rodi.isEmpty) && (Double(tbl2[i].rodi[0][0])! < 7.0) && (Double(tbl2[i].rodi[0][0])! > 4.0) {
                par = 2
            } else if (!tbl2[i].rodi.isEmpty) && (Double(tbl2[i].rodi[0][0])! < 4.0) && (Double(tbl2[i].rodi[0][0])! > 0.0) {
                par = 3
            } else {
                par = 4
            }
            var rodi_lvl: [String] = []
            for i2 in 0..<tbl2[i].rodi.count {
                rodi_lvl.append(tbl2[i].rodi[i2][0]+"\t")
            }
            if  par == 1 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 12, rodi_lvl.joined(separator: "\n") , merge_format4_red)
            } else if par == 2 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 12, rodi_lvl.joined(separator: "\n") , merge_format4)
            } else if par == 3 {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 12, rodi_lvl.joined(separator: "\n") , merge_format4_blue)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 12, rodi_lvl.joined(separator: "\n") , nil)
            }
            var rodi_time: [String] = []
            for i2 in 0..<tbl2[i].rodi.count {
                rodi_time.append(tbl2[i].rodi[i2][1]+"\t")
            }
            if rodi_time.isEmpty {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 13, rodi_time.joined(separator: "\n") , nil)
            } else {
                worksheet_write_string(worksheet2, lxw_row_t(i1+3), 13, rodi_time.joined(separator: "\n") , merge_format42)
            }
            i1 += 1
        }
        
        worksheet_protect(worksheet1, "pass123", nil)
        let error = workbook_close(workbook)
        
        if (error.rawValue != LXW_NO_ERROR.rawValue){
            print("Error in workbook_close().\nError %d = %s\n", error, lxw_strerror(error)!)
        }
        return fileURL
    }
}
