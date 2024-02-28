; ModuleID = 'mm.c'
source_filename = "mm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.block = type { i64, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %struct.block*, %struct.block* }

@seglist = internal unnamed_addr global [14 x %struct.block*] zeroinitializer, align 16, !dbg !0
@heap_start = internal unnamed_addr global %struct.block* null, align 8, !dbg !50

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define dso_local zeroext i1 @mm_checkheap(i32 noundef %0) local_unnamed_addr #0 !dbg !66 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !71, metadata !DIExpression()), !dbg !72
  ret i1 true, !dbg !73
}

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @mm_init() local_unnamed_addr #1 !dbg !74 {
  %1 = tail call i8* @mem_sbrk(i64 noundef 16) #6, !dbg !81
  call void @llvm.dbg.value(metadata i8* %1, metadata !78, metadata !DIExpression()), !dbg !82
  %2 = icmp eq i8* %1, inttoptr (i64 -1 to i8*), !dbg !83
  br i1 %2, label %16, label %3, !dbg !85

3:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i8* %1, metadata !78, metadata !DIExpression()), !dbg !82
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(112) bitcast ([14 x %struct.block*]* @seglist to i8*), i8 0, i64 112, i1 false), !dbg !86, !tbaa !89
  call void @llvm.dbg.value(metadata i32 undef, metadata !79, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.value(metadata i32 undef, metadata !79, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !93
  %4 = getelementptr inbounds i8, i8* %1, i64 8, !dbg !94
  %5 = bitcast i8* %1 to <2 x i64>*, !dbg !95
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 8, !dbg !95, !tbaa !96
  store i8* %4, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !98, !tbaa !89
  call void @llvm.dbg.value(metadata i64 4096, metadata !99, metadata !DIExpression()) #6, !dbg !107
  call void @llvm.dbg.value(metadata i64 4096, metadata !99, metadata !DIExpression()) #6, !dbg !107
  %6 = tail call i8* @mem_sbrk(i64 noundef 4096) #6, !dbg !110
  call void @llvm.dbg.value(metadata i8* %6, metadata !104, metadata !DIExpression()) #6, !dbg !107
  %7 = icmp eq i8* %6, inttoptr (i64 -1 to i8*), !dbg !112
  br i1 %7, label %16, label %8, !dbg !113

8:                                                ; preds = %3
  call void @llvm.dbg.value(metadata i8* %6, metadata !114, metadata !DIExpression()) #6, !dbg !119
  %9 = getelementptr inbounds i8, i8* %6, i64 -8, !dbg !121
  %10 = bitcast i8* %9 to %struct.block*, !dbg !122
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !105, metadata !DIExpression()) #6, !dbg !107
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !123, metadata !DIExpression()) #6, !dbg !131
  call void @llvm.dbg.value(metadata i64 4096, metadata !128, metadata !DIExpression()) #6, !dbg !131
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !131
  %11 = bitcast i8* %9 to i64*, !dbg !133
  store i64 4096, i64* %11, align 8, !dbg !134, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !137, metadata !DIExpression()) #6, !dbg !142
  %12 = getelementptr inbounds i8, i8* %6, i64 4080, !dbg !144
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !145, metadata !DIExpression()) #6, !dbg !150
  call void @llvm.dbg.value(metadata i8* %6, metadata !106, metadata !DIExpression(DW_OP_plus_uconst, 4088, DW_OP_stack_value)) #6, !dbg !107
  call void @llvm.dbg.value(metadata i8* %6, metadata !152, metadata !DIExpression(DW_OP_plus_uconst, 4088, DW_OP_stack_value)) #6, !dbg !157
  %13 = bitcast i8* %12 to <2 x i64>*, !dbg !159
  call void @llvm.dbg.value(metadata <2 x i64>* %13, metadata !130, metadata !DIExpression()) #6, !dbg !131
  store <2 x i64> <i64 4096, i64 1>, <2 x i64>* %13, align 8, !dbg !159, !tbaa !96
  %14 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %10) #6, !dbg !160
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !105, metadata !DIExpression()) #6, !dbg !107
  %15 = icmp ne %struct.block* %14, null
  br label %16

16:                                               ; preds = %8, %3, %0
  %17 = phi i1 [ false, %0 ], [ %15, %8 ], [ false, %3 ], !dbg !82
  ret i1 %17, !dbg !161
}

declare !dbg !162 i8* @mem_sbrk(i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_malloc(i64 noundef %0) local_unnamed_addr #1 !dbg !167 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !171, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i8* null, metadata !175, metadata !DIExpression()), !dbg !177
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !178, !tbaa !89
  %3 = icmp eq %struct.block* %2, null, !dbg !180
  br i1 %3, label %4, label %22, !dbg !181

4:                                                ; preds = %1
  %5 = tail call i8* @mem_sbrk(i64 noundef 16) #6, !dbg !182
  call void @llvm.dbg.value(metadata i8* %5, metadata !78, metadata !DIExpression()) #6, !dbg !186
  %6 = icmp eq i8* %5, inttoptr (i64 -1 to i8*), !dbg !187
  br i1 %6, label %522, label %7, !dbg !188

7:                                                ; preds = %4
  call void @llvm.dbg.value(metadata i8* %5, metadata !78, metadata !DIExpression()) #6, !dbg !186
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(112) bitcast ([14 x %struct.block*]* @seglist to i8*), i8 0, i64 112, i1 false) #6, !dbg !189, !tbaa !89
  call void @llvm.dbg.value(metadata i32 undef, metadata !79, metadata !DIExpression()) #6, !dbg !190
  call void @llvm.dbg.value(metadata i32 undef, metadata !79, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !190
  %8 = getelementptr inbounds i8, i8* %5, i64 8, !dbg !191
  %9 = bitcast i8* %5 to <2 x i64>*, !dbg !192
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 8, !dbg !192, !tbaa !96
  store i8* %8, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !193, !tbaa !89
  call void @llvm.dbg.value(metadata i64 4096, metadata !99, metadata !DIExpression()) #6, !dbg !194
  call void @llvm.dbg.value(metadata i64 4096, metadata !99, metadata !DIExpression()) #6, !dbg !194
  %10 = tail call i8* @mem_sbrk(i64 noundef 4096) #6, !dbg !196
  call void @llvm.dbg.value(metadata i8* %10, metadata !104, metadata !DIExpression()) #6, !dbg !194
  %11 = icmp eq i8* %10, inttoptr (i64 -1 to i8*), !dbg !197
  br i1 %11, label %522, label %12, !dbg !198

12:                                               ; preds = %7
  call void @llvm.dbg.value(metadata i8* %10, metadata !114, metadata !DIExpression()) #6, !dbg !199
  %13 = getelementptr inbounds i8, i8* %10, i64 -8, !dbg !201
  %14 = bitcast i8* %13 to %struct.block*, !dbg !202
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !105, metadata !DIExpression()) #6, !dbg !194
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !123, metadata !DIExpression()) #6, !dbg !203
  call void @llvm.dbg.value(metadata i64 4096, metadata !128, metadata !DIExpression()) #6, !dbg !203
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !203
  %15 = bitcast i8* %13 to i64*, !dbg !205
  store i64 4096, i64* %15, align 8, !dbg !206, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !137, metadata !DIExpression()) #6, !dbg !207
  %16 = getelementptr inbounds i8, i8* %10, i64 4080, !dbg !209
  call void @llvm.dbg.value(metadata %struct.block* %14, metadata !145, metadata !DIExpression()) #6, !dbg !210
  call void @llvm.dbg.value(metadata i8* %10, metadata !106, metadata !DIExpression(DW_OP_plus_uconst, 4088, DW_OP_stack_value)) #6, !dbg !194
  call void @llvm.dbg.value(metadata i8* %10, metadata !152, metadata !DIExpression(DW_OP_plus_uconst, 4088, DW_OP_stack_value)) #6, !dbg !212
  %17 = bitcast i8* %16 to <2 x i64>*, !dbg !214
  call void @llvm.dbg.value(metadata <2 x i64>* %17, metadata !130, metadata !DIExpression()) #6, !dbg !203
  store <2 x i64> <i64 4096, i64 1>, <2 x i64>* %17, align 8, !dbg !214, !tbaa !96
  %18 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %14) #6, !dbg !215
  call void @llvm.dbg.value(metadata %struct.block* %18, metadata !105, metadata !DIExpression()) #6, !dbg !194
  %19 = icmp eq %struct.block* %18, null
  %20 = icmp eq i64 %0, 0
  %21 = or i1 %20, %19, !dbg !216
  br i1 %21, label %522, label %24, !dbg !216

22:                                               ; preds = %1
  %23 = icmp eq i64 %0, 0, !dbg !217
  br i1 %23, label %522, label %24, !dbg !219

24:                                               ; preds = %12, %22
  call void @llvm.dbg.value(metadata i64 %0, metadata !220, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)), !dbg !226
  call void @llvm.dbg.value(metadata i64 16, metadata !225, metadata !DIExpression()), !dbg !226
  %25 = add i64 %0, 31, !dbg !228
  %26 = and i64 %25, -16, !dbg !229
  call void @llvm.dbg.value(metadata i64 %26, metadata !172, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 %26, metadata !230, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.value(metadata i64 %26, metadata !238, metadata !DIExpression()), !dbg !243
  %27 = icmp ult i64 %26, 32, !dbg !245
  br i1 %27, label %53, label %28, !dbg !247

28:                                               ; preds = %24
  %29 = icmp ult i64 %26, 64
  br i1 %29, label %53, label %30, !dbg !248

30:                                               ; preds = %28
  %31 = icmp ult i64 %26, 128
  br i1 %31, label %53, label %32, !dbg !250

32:                                               ; preds = %30
  %33 = icmp ult i64 %26, 256
  br i1 %33, label %53, label %34, !dbg !252

34:                                               ; preds = %32
  %35 = icmp ult i64 %26, 512
  br i1 %35, label %53, label %36, !dbg !254

36:                                               ; preds = %34
  %37 = icmp ult i64 %26, 1024
  br i1 %37, label %53, label %38, !dbg !256

38:                                               ; preds = %36
  %39 = icmp ult i64 %26, 2048
  br i1 %39, label %53, label %40, !dbg !258

40:                                               ; preds = %38
  %41 = icmp ult i64 %26, 4096
  br i1 %41, label %53, label %42, !dbg !260

42:                                               ; preds = %40
  %43 = icmp ult i64 %26, 8192
  br i1 %43, label %53, label %44, !dbg !262

44:                                               ; preds = %42
  %45 = icmp ult i64 %26, 16384
  br i1 %45, label %53, label %46, !dbg !264

46:                                               ; preds = %44
  %47 = icmp ult i64 %26, 32768
  br i1 %47, label %53, label %48, !dbg !266

48:                                               ; preds = %46
  %49 = icmp ult i64 %26, 65536
  br i1 %49, label %53, label %50, !dbg !268

50:                                               ; preds = %48
  %51 = icmp ult i64 %26, 131072
  %52 = select i1 %51, i64 12, i64 13, !dbg !270
  br label %53, !dbg !270

53:                                               ; preds = %50, %48, %46, %44, %42, %40, %38, %36, %34, %32, %30, %28, %24
  %54 = phi i64 [ %52, %50 ], [ 11, %48 ], [ 10, %46 ], [ 9, %44 ], [ 8, %42 ], [ 7, %40 ], [ 6, %38 ], [ 5, %36 ], [ 4, %34 ], [ 3, %32 ], [ 2, %30 ], [ 1, %28 ], [ 0, %24 ]
  br label %55, !dbg !272

55:                                               ; preds = %53, %336
  %56 = phi i64 [ %337, %336 ], [ %54, %53 ]
  call void @llvm.dbg.value(metadata i64 %56, metadata !234, metadata !DIExpression()), !dbg !273
  %57 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %56, !dbg !274
  %58 = load %struct.block*, %struct.block** %57, align 8, !dbg !274, !tbaa !89
  call void @llvm.dbg.value(metadata %struct.block* %58, metadata !277, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata i64 %26, metadata !282, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata i32 0, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata i64 -1, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !284, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %58, metadata !283, metadata !DIExpression()), !dbg !288
  %59 = icmp eq %struct.block* %58, null, !dbg !290
  br i1 %59, label %336, label %60, !dbg !291

60:                                               ; preds = %55
  %61 = getelementptr %struct.block, %struct.block* %58, i64 0, i32 0, !dbg !292
  %62 = load i64, i64* %61, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %62, metadata !301, metadata !DIExpression()), !dbg !306
  %63 = and i64 %62, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %63, metadata !286, metadata !DIExpression()), !dbg !288
  %64 = icmp eq i64 %63, %26, !dbg !309
  br i1 %64, label %357, label %65, !dbg !311

65:                                               ; preds = %60
  %66 = icmp ugt i64 %63, %26, !dbg !312
  %67 = select i1 %66, %struct.block* %58, %struct.block* null, !dbg !314
  %68 = select i1 %66, i64 %63, i64 -1, !dbg !314
  call void @llvm.dbg.value(metadata i64 %68, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %67, metadata !284, metadata !DIExpression()), !dbg !288
  %69 = getelementptr inbounds %struct.block, %struct.block* %58, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %70 = load %struct.block*, %struct.block** %69, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 1, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %70, metadata !283, metadata !DIExpression()), !dbg !288
  %71 = icmp eq %struct.block* %70, null, !dbg !290
  br i1 %71, label %333, label %72, !dbg !291

72:                                               ; preds = %65
  %73 = getelementptr %struct.block, %struct.block* %70, i64 0, i32 0, !dbg !292
  %74 = load i64, i64* %73, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %74, metadata !301, metadata !DIExpression()), !dbg !306
  %75 = and i64 %74, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %75, metadata !286, metadata !DIExpression()), !dbg !288
  %76 = icmp eq i64 %75, %26, !dbg !309
  br i1 %76, label %357, label %77, !dbg !311

77:                                               ; preds = %72
  %78 = icmp ugt i64 %75, %26, !dbg !312
  %79 = icmp ult i64 %75, %68
  %80 = select i1 %78, i1 %79, i1 false, !dbg !314
  %81 = select i1 %80, %struct.block* %70, %struct.block* %67, !dbg !314
  %82 = select i1 %80, i64 %75, i64 %68, !dbg !314
  call void @llvm.dbg.value(metadata i64 %82, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %81, metadata !284, metadata !DIExpression()), !dbg !288
  %83 = getelementptr inbounds %struct.block, %struct.block* %70, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %84 = load %struct.block*, %struct.block** %83, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 2, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %84, metadata !283, metadata !DIExpression()), !dbg !288
  %85 = icmp eq %struct.block* %84, null, !dbg !290
  br i1 %85, label %333, label %86, !dbg !291

86:                                               ; preds = %77
  %87 = getelementptr %struct.block, %struct.block* %84, i64 0, i32 0, !dbg !292
  %88 = load i64, i64* %87, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %88, metadata !301, metadata !DIExpression()), !dbg !306
  %89 = and i64 %88, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %89, metadata !286, metadata !DIExpression()), !dbg !288
  %90 = icmp eq i64 %89, %26, !dbg !309
  br i1 %90, label %357, label %91, !dbg !311

91:                                               ; preds = %86
  %92 = icmp ugt i64 %89, %26, !dbg !312
  %93 = icmp ult i64 %89, %82
  %94 = select i1 %92, i1 %93, i1 false, !dbg !314
  %95 = select i1 %94, %struct.block* %84, %struct.block* %81, !dbg !314
  %96 = select i1 %94, i64 %89, i64 %82, !dbg !314
  call void @llvm.dbg.value(metadata i64 %96, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !284, metadata !DIExpression()), !dbg !288
  %97 = getelementptr inbounds %struct.block, %struct.block* %84, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %98 = load %struct.block*, %struct.block** %97, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 3, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %98, metadata !283, metadata !DIExpression()), !dbg !288
  %99 = icmp eq %struct.block* %98, null, !dbg !290
  br i1 %99, label %333, label %100, !dbg !291

100:                                              ; preds = %91
  %101 = getelementptr %struct.block, %struct.block* %98, i64 0, i32 0, !dbg !292
  %102 = load i64, i64* %101, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %102, metadata !301, metadata !DIExpression()), !dbg !306
  %103 = and i64 %102, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %103, metadata !286, metadata !DIExpression()), !dbg !288
  %104 = icmp eq i64 %103, %26, !dbg !309
  br i1 %104, label %357, label %105, !dbg !311

105:                                              ; preds = %100
  %106 = icmp ugt i64 %103, %26, !dbg !312
  %107 = icmp ult i64 %103, %96
  %108 = select i1 %106, i1 %107, i1 false, !dbg !314
  %109 = select i1 %108, %struct.block* %98, %struct.block* %95, !dbg !314
  %110 = select i1 %108, i64 %103, i64 %96, !dbg !314
  call void @llvm.dbg.value(metadata i64 %110, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %109, metadata !284, metadata !DIExpression()), !dbg !288
  %111 = getelementptr inbounds %struct.block, %struct.block* %98, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %112 = load %struct.block*, %struct.block** %111, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 4, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %112, metadata !283, metadata !DIExpression()), !dbg !288
  %113 = icmp eq %struct.block* %112, null, !dbg !290
  br i1 %113, label %333, label %114, !dbg !291

114:                                              ; preds = %105
  %115 = getelementptr %struct.block, %struct.block* %112, i64 0, i32 0, !dbg !292
  %116 = load i64, i64* %115, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %116, metadata !301, metadata !DIExpression()), !dbg !306
  %117 = and i64 %116, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %117, metadata !286, metadata !DIExpression()), !dbg !288
  %118 = icmp eq i64 %117, %26, !dbg !309
  br i1 %118, label %357, label %119, !dbg !311

119:                                              ; preds = %114
  %120 = icmp ugt i64 %117, %26, !dbg !312
  %121 = icmp ult i64 %117, %110
  %122 = select i1 %120, i1 %121, i1 false, !dbg !314
  %123 = select i1 %122, %struct.block* %112, %struct.block* %109, !dbg !314
  %124 = select i1 %122, i64 %117, i64 %110, !dbg !314
  call void @llvm.dbg.value(metadata i64 %124, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %123, metadata !284, metadata !DIExpression()), !dbg !288
  %125 = getelementptr inbounds %struct.block, %struct.block* %112, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %126 = load %struct.block*, %struct.block** %125, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 5, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %126, metadata !283, metadata !DIExpression()), !dbg !288
  %127 = icmp eq %struct.block* %126, null, !dbg !290
  br i1 %127, label %333, label %128, !dbg !291

128:                                              ; preds = %119
  %129 = getelementptr %struct.block, %struct.block* %126, i64 0, i32 0, !dbg !292
  %130 = load i64, i64* %129, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %130, metadata !301, metadata !DIExpression()), !dbg !306
  %131 = and i64 %130, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %131, metadata !286, metadata !DIExpression()), !dbg !288
  %132 = icmp eq i64 %131, %26, !dbg !309
  br i1 %132, label %357, label %133, !dbg !311

133:                                              ; preds = %128
  %134 = icmp ugt i64 %131, %26, !dbg !312
  %135 = icmp ult i64 %131, %124
  %136 = select i1 %134, i1 %135, i1 false, !dbg !314
  %137 = select i1 %136, %struct.block* %126, %struct.block* %123, !dbg !314
  %138 = select i1 %136, i64 %131, i64 %124, !dbg !314
  call void @llvm.dbg.value(metadata i64 %138, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %137, metadata !284, metadata !DIExpression()), !dbg !288
  %139 = getelementptr inbounds %struct.block, %struct.block* %126, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %140 = load %struct.block*, %struct.block** %139, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 6, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %140, metadata !283, metadata !DIExpression()), !dbg !288
  %141 = icmp eq %struct.block* %140, null, !dbg !290
  br i1 %141, label %333, label %142, !dbg !291

142:                                              ; preds = %133
  %143 = getelementptr %struct.block, %struct.block* %140, i64 0, i32 0, !dbg !292
  %144 = load i64, i64* %143, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %144, metadata !301, metadata !DIExpression()), !dbg !306
  %145 = and i64 %144, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %145, metadata !286, metadata !DIExpression()), !dbg !288
  %146 = icmp eq i64 %145, %26, !dbg !309
  br i1 %146, label %357, label %147, !dbg !311

147:                                              ; preds = %142
  %148 = icmp ugt i64 %145, %26, !dbg !312
  %149 = icmp ult i64 %145, %138
  %150 = select i1 %148, i1 %149, i1 false, !dbg !314
  %151 = select i1 %150, %struct.block* %140, %struct.block* %137, !dbg !314
  %152 = select i1 %150, i64 %145, i64 %138, !dbg !314
  call void @llvm.dbg.value(metadata i64 %152, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %151, metadata !284, metadata !DIExpression()), !dbg !288
  %153 = getelementptr inbounds %struct.block, %struct.block* %140, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %154 = load %struct.block*, %struct.block** %153, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 7, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %154, metadata !283, metadata !DIExpression()), !dbg !288
  %155 = icmp eq %struct.block* %154, null, !dbg !290
  br i1 %155, label %333, label %156, !dbg !291

156:                                              ; preds = %147
  %157 = getelementptr %struct.block, %struct.block* %154, i64 0, i32 0, !dbg !292
  %158 = load i64, i64* %157, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %158, metadata !301, metadata !DIExpression()), !dbg !306
  %159 = and i64 %158, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %159, metadata !286, metadata !DIExpression()), !dbg !288
  %160 = icmp eq i64 %159, %26, !dbg !309
  br i1 %160, label %357, label %161, !dbg !311

161:                                              ; preds = %156
  %162 = icmp ugt i64 %159, %26, !dbg !312
  %163 = icmp ult i64 %159, %152
  %164 = select i1 %162, i1 %163, i1 false, !dbg !314
  %165 = select i1 %164, %struct.block* %154, %struct.block* %151, !dbg !314
  %166 = select i1 %164, i64 %159, i64 %152, !dbg !314
  call void @llvm.dbg.value(metadata i64 %166, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %165, metadata !284, metadata !DIExpression()), !dbg !288
  %167 = getelementptr inbounds %struct.block, %struct.block* %154, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %168 = load %struct.block*, %struct.block** %167, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 8, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %168, metadata !283, metadata !DIExpression()), !dbg !288
  %169 = icmp eq %struct.block* %168, null, !dbg !290
  br i1 %169, label %333, label %170, !dbg !291

170:                                              ; preds = %161
  %171 = getelementptr %struct.block, %struct.block* %168, i64 0, i32 0, !dbg !292
  %172 = load i64, i64* %171, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %172, metadata !301, metadata !DIExpression()), !dbg !306
  %173 = and i64 %172, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %173, metadata !286, metadata !DIExpression()), !dbg !288
  %174 = icmp eq i64 %173, %26, !dbg !309
  br i1 %174, label %357, label %175, !dbg !311

175:                                              ; preds = %170
  %176 = icmp ugt i64 %173, %26, !dbg !312
  %177 = icmp ult i64 %173, %166
  %178 = select i1 %176, i1 %177, i1 false, !dbg !314
  %179 = select i1 %178, %struct.block* %168, %struct.block* %165, !dbg !314
  %180 = select i1 %178, i64 %173, i64 %166, !dbg !314
  call void @llvm.dbg.value(metadata i64 %180, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %179, metadata !284, metadata !DIExpression()), !dbg !288
  %181 = getelementptr inbounds %struct.block, %struct.block* %168, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %182 = load %struct.block*, %struct.block** %181, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 9, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %182, metadata !283, metadata !DIExpression()), !dbg !288
  %183 = icmp eq %struct.block* %182, null, !dbg !290
  br i1 %183, label %333, label %184, !dbg !291

184:                                              ; preds = %175
  %185 = getelementptr %struct.block, %struct.block* %182, i64 0, i32 0, !dbg !292
  %186 = load i64, i64* %185, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %186, metadata !301, metadata !DIExpression()), !dbg !306
  %187 = and i64 %186, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %187, metadata !286, metadata !DIExpression()), !dbg !288
  %188 = icmp eq i64 %187, %26, !dbg !309
  br i1 %188, label %357, label %189, !dbg !311

189:                                              ; preds = %184
  %190 = icmp ugt i64 %187, %26, !dbg !312
  %191 = icmp ult i64 %187, %180
  %192 = select i1 %190, i1 %191, i1 false, !dbg !314
  %193 = select i1 %192, %struct.block* %182, %struct.block* %179, !dbg !314
  %194 = select i1 %192, i64 %187, i64 %180, !dbg !314
  call void @llvm.dbg.value(metadata i64 %194, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %193, metadata !284, metadata !DIExpression()), !dbg !288
  %195 = getelementptr inbounds %struct.block, %struct.block* %182, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %196 = load %struct.block*, %struct.block** %195, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 10, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %196, metadata !283, metadata !DIExpression()), !dbg !288
  %197 = icmp eq %struct.block* %196, null, !dbg !290
  br i1 %197, label %333, label %198, !dbg !291

198:                                              ; preds = %189
  %199 = getelementptr %struct.block, %struct.block* %196, i64 0, i32 0, !dbg !292
  %200 = load i64, i64* %199, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %200, metadata !301, metadata !DIExpression()), !dbg !306
  %201 = and i64 %200, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %201, metadata !286, metadata !DIExpression()), !dbg !288
  %202 = icmp eq i64 %201, %26, !dbg !309
  br i1 %202, label %357, label %203, !dbg !311

203:                                              ; preds = %198
  %204 = icmp ugt i64 %201, %26, !dbg !312
  %205 = icmp ult i64 %201, %194
  %206 = select i1 %204, i1 %205, i1 false, !dbg !314
  %207 = select i1 %206, %struct.block* %196, %struct.block* %193, !dbg !314
  %208 = select i1 %206, i64 %201, i64 %194, !dbg !314
  call void @llvm.dbg.value(metadata i64 %208, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %207, metadata !284, metadata !DIExpression()), !dbg !288
  %209 = getelementptr inbounds %struct.block, %struct.block* %196, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %210 = load %struct.block*, %struct.block** %209, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 11, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %210, metadata !283, metadata !DIExpression()), !dbg !288
  %211 = icmp eq %struct.block* %210, null, !dbg !290
  br i1 %211, label %333, label %212, !dbg !291

212:                                              ; preds = %203
  %213 = getelementptr %struct.block, %struct.block* %210, i64 0, i32 0, !dbg !292
  %214 = load i64, i64* %213, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %214, metadata !301, metadata !DIExpression()), !dbg !306
  %215 = and i64 %214, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %215, metadata !286, metadata !DIExpression()), !dbg !288
  %216 = icmp eq i64 %215, %26, !dbg !309
  br i1 %216, label %357, label %217, !dbg !311

217:                                              ; preds = %212
  %218 = icmp ugt i64 %215, %26, !dbg !312
  %219 = icmp ult i64 %215, %208
  %220 = select i1 %218, i1 %219, i1 false, !dbg !314
  %221 = select i1 %220, %struct.block* %210, %struct.block* %207, !dbg !314
  %222 = select i1 %220, i64 %215, i64 %208, !dbg !314
  call void @llvm.dbg.value(metadata i64 %222, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %221, metadata !284, metadata !DIExpression()), !dbg !288
  %223 = getelementptr inbounds %struct.block, %struct.block* %210, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %224 = load %struct.block*, %struct.block** %223, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 12, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %224, metadata !283, metadata !DIExpression()), !dbg !288
  %225 = icmp eq %struct.block* %224, null, !dbg !290
  br i1 %225, label %333, label %226, !dbg !291

226:                                              ; preds = %217
  %227 = getelementptr %struct.block, %struct.block* %224, i64 0, i32 0, !dbg !292
  %228 = load i64, i64* %227, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %228, metadata !301, metadata !DIExpression()), !dbg !306
  %229 = and i64 %228, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %229, metadata !286, metadata !DIExpression()), !dbg !288
  %230 = icmp eq i64 %229, %26, !dbg !309
  br i1 %230, label %357, label %231, !dbg !311

231:                                              ; preds = %226
  %232 = icmp ugt i64 %229, %26, !dbg !312
  %233 = icmp ult i64 %229, %222
  %234 = select i1 %232, i1 %233, i1 false, !dbg !314
  %235 = select i1 %234, %struct.block* %224, %struct.block* %221, !dbg !314
  %236 = select i1 %234, i64 %229, i64 %222, !dbg !314
  call void @llvm.dbg.value(metadata i64 %236, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %235, metadata !284, metadata !DIExpression()), !dbg !288
  %237 = getelementptr inbounds %struct.block, %struct.block* %224, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %238 = load %struct.block*, %struct.block** %237, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 13, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %238, metadata !283, metadata !DIExpression()), !dbg !288
  %239 = icmp eq %struct.block* %238, null, !dbg !290
  br i1 %239, label %333, label %240, !dbg !291

240:                                              ; preds = %231
  %241 = getelementptr %struct.block, %struct.block* %238, i64 0, i32 0, !dbg !292
  %242 = load i64, i64* %241, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %242, metadata !301, metadata !DIExpression()), !dbg !306
  %243 = and i64 %242, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %243, metadata !286, metadata !DIExpression()), !dbg !288
  %244 = icmp eq i64 %243, %26, !dbg !309
  br i1 %244, label %357, label %245, !dbg !311

245:                                              ; preds = %240
  %246 = icmp ugt i64 %243, %26, !dbg !312
  %247 = icmp ult i64 %243, %236
  %248 = select i1 %246, i1 %247, i1 false, !dbg !314
  %249 = select i1 %248, %struct.block* %238, %struct.block* %235, !dbg !314
  %250 = select i1 %248, i64 %243, i64 %236, !dbg !314
  call void @llvm.dbg.value(metadata i64 %250, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %249, metadata !284, metadata !DIExpression()), !dbg !288
  %251 = getelementptr inbounds %struct.block, %struct.block* %238, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %252 = load %struct.block*, %struct.block** %251, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 14, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %252, metadata !283, metadata !DIExpression()), !dbg !288
  %253 = icmp eq %struct.block* %252, null, !dbg !290
  br i1 %253, label %333, label %254, !dbg !291

254:                                              ; preds = %245
  %255 = getelementptr %struct.block, %struct.block* %252, i64 0, i32 0, !dbg !292
  %256 = load i64, i64* %255, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %256, metadata !301, metadata !DIExpression()), !dbg !306
  %257 = and i64 %256, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %257, metadata !286, metadata !DIExpression()), !dbg !288
  %258 = icmp eq i64 %257, %26, !dbg !309
  br i1 %258, label %357, label %259, !dbg !311

259:                                              ; preds = %254
  %260 = icmp ugt i64 %257, %26, !dbg !312
  %261 = icmp ult i64 %257, %250
  %262 = select i1 %260, i1 %261, i1 false, !dbg !314
  %263 = select i1 %262, %struct.block* %252, %struct.block* %249, !dbg !314
  %264 = select i1 %262, i64 %257, i64 %250, !dbg !314
  call void @llvm.dbg.value(metadata i64 %264, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %263, metadata !284, metadata !DIExpression()), !dbg !288
  %265 = getelementptr inbounds %struct.block, %struct.block* %252, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %266 = load %struct.block*, %struct.block** %265, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 15, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %266, metadata !283, metadata !DIExpression()), !dbg !288
  %267 = icmp eq %struct.block* %266, null, !dbg !290
  br i1 %267, label %333, label %268, !dbg !291

268:                                              ; preds = %259
  %269 = getelementptr %struct.block, %struct.block* %266, i64 0, i32 0, !dbg !292
  %270 = load i64, i64* %269, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %270, metadata !301, metadata !DIExpression()), !dbg !306
  %271 = and i64 %270, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %271, metadata !286, metadata !DIExpression()), !dbg !288
  %272 = icmp eq i64 %271, %26, !dbg !309
  br i1 %272, label %357, label %273, !dbg !311

273:                                              ; preds = %268
  %274 = icmp ugt i64 %271, %26, !dbg !312
  %275 = icmp ult i64 %271, %264
  %276 = select i1 %274, i1 %275, i1 false, !dbg !314
  %277 = select i1 %276, %struct.block* %266, %struct.block* %263, !dbg !314
  %278 = select i1 %276, i64 %271, i64 %264, !dbg !314
  call void @llvm.dbg.value(metadata i64 %278, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %277, metadata !284, metadata !DIExpression()), !dbg !288
  %279 = getelementptr inbounds %struct.block, %struct.block* %266, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %280 = load %struct.block*, %struct.block** %279, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 16, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %280, metadata !283, metadata !DIExpression()), !dbg !288
  %281 = icmp eq %struct.block* %280, null, !dbg !290
  br i1 %281, label %333, label %282, !dbg !291

282:                                              ; preds = %273
  %283 = getelementptr %struct.block, %struct.block* %280, i64 0, i32 0, !dbg !292
  %284 = load i64, i64* %283, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %284, metadata !301, metadata !DIExpression()), !dbg !306
  %285 = and i64 %284, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %285, metadata !286, metadata !DIExpression()), !dbg !288
  %286 = icmp eq i64 %285, %26, !dbg !309
  br i1 %286, label %357, label %287, !dbg !311

287:                                              ; preds = %282
  %288 = icmp ugt i64 %285, %26, !dbg !312
  %289 = icmp ult i64 %285, %278
  %290 = select i1 %288, i1 %289, i1 false, !dbg !314
  %291 = select i1 %290, %struct.block* %280, %struct.block* %277, !dbg !314
  %292 = select i1 %290, i64 %285, i64 %278, !dbg !314
  call void @llvm.dbg.value(metadata i64 %292, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %291, metadata !284, metadata !DIExpression()), !dbg !288
  %293 = getelementptr inbounds %struct.block, %struct.block* %280, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %294 = load %struct.block*, %struct.block** %293, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 17, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %294, metadata !283, metadata !DIExpression()), !dbg !288
  %295 = icmp eq %struct.block* %294, null, !dbg !290
  br i1 %295, label %333, label %296, !dbg !291

296:                                              ; preds = %287
  %297 = getelementptr %struct.block, %struct.block* %294, i64 0, i32 0, !dbg !292
  %298 = load i64, i64* %297, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %298, metadata !301, metadata !DIExpression()), !dbg !306
  %299 = and i64 %298, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %299, metadata !286, metadata !DIExpression()), !dbg !288
  %300 = icmp eq i64 %299, %26, !dbg !309
  br i1 %300, label %357, label %301, !dbg !311

301:                                              ; preds = %296
  %302 = icmp ugt i64 %299, %26, !dbg !312
  %303 = icmp ult i64 %299, %292
  %304 = select i1 %302, i1 %303, i1 false, !dbg !314
  %305 = select i1 %304, %struct.block* %294, %struct.block* %291, !dbg !314
  %306 = select i1 %304, i64 %299, i64 %292, !dbg !314
  call void @llvm.dbg.value(metadata i64 %306, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %305, metadata !284, metadata !DIExpression()), !dbg !288
  %307 = getelementptr inbounds %struct.block, %struct.block* %294, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %308 = load %struct.block*, %struct.block** %307, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 18, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %308, metadata !283, metadata !DIExpression()), !dbg !288
  %309 = icmp eq %struct.block* %308, null, !dbg !290
  br i1 %309, label %333, label %310, !dbg !291

310:                                              ; preds = %301
  %311 = getelementptr %struct.block, %struct.block* %308, i64 0, i32 0, !dbg !292
  %312 = load i64, i64* %311, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %312, metadata !301, metadata !DIExpression()), !dbg !306
  %313 = and i64 %312, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %313, metadata !286, metadata !DIExpression()), !dbg !288
  %314 = icmp eq i64 %313, %26, !dbg !309
  br i1 %314, label %357, label %315, !dbg !311

315:                                              ; preds = %310
  %316 = icmp ugt i64 %313, %26, !dbg !312
  %317 = icmp ult i64 %313, %306
  %318 = select i1 %316, i1 %317, i1 false, !dbg !314
  %319 = select i1 %318, %struct.block* %308, %struct.block* %305, !dbg !314
  %320 = select i1 %318, i64 %313, i64 %306, !dbg !314
  call void @llvm.dbg.value(metadata i64 %320, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %319, metadata !284, metadata !DIExpression()), !dbg !288
  %321 = getelementptr inbounds %struct.block, %struct.block* %308, i64 0, i32 1, i32 0, i32 1, !dbg !315
  %322 = load %struct.block*, %struct.block** %321, align 8, !dbg !315, !tbaa !316
  call void @llvm.dbg.value(metadata i32 19, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %322, metadata !283, metadata !DIExpression()), !dbg !288
  %323 = icmp eq %struct.block* %322, null, !dbg !290
  br i1 %323, label %333, label %324, !dbg !291

324:                                              ; preds = %315
  %325 = getelementptr %struct.block, %struct.block* %322, i64 0, i32 0, !dbg !292
  %326 = load i64, i64* %325, align 8, !dbg !292, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %326, metadata !301, metadata !DIExpression()), !dbg !306
  %327 = and i64 %326, -16, !dbg !308
  call void @llvm.dbg.value(metadata i64 %327, metadata !286, metadata !DIExpression()), !dbg !288
  %328 = icmp eq i64 %327, %26, !dbg !309
  br i1 %328, label %357, label %329, !dbg !311

329:                                              ; preds = %324
  %330 = icmp ugt i64 %327, %26, !dbg !312
  %331 = icmp ult i64 %327, %320
  %332 = select i1 %330, i1 %331, i1 false, !dbg !314
  call void @llvm.dbg.value(metadata i64 undef, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !284, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !283, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.value(metadata i32 20, metadata !287, metadata !DIExpression()), !dbg !288
  br i1 %332, label %357, label %333

333:                                              ; preds = %329, %315, %301, %287, %273, %259, %245, %231, %217, %203, %189, %175, %161, %147, %133, %119, %105, %91, %77, %65
  %334 = phi %struct.block* [ %67, %65 ], [ %81, %77 ], [ %95, %91 ], [ %109, %105 ], [ %123, %119 ], [ %137, %133 ], [ %151, %147 ], [ %165, %161 ], [ %179, %175 ], [ %193, %189 ], [ %207, %203 ], [ %221, %217 ], [ %235, %231 ], [ %249, %245 ], [ %263, %259 ], [ %277, %273 ], [ %291, %287 ], [ %305, %301 ], [ %319, %315 ], [ %319, %329 ], !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %334, metadata !233, metadata !DIExpression()), !dbg !236
  %335 = icmp eq %struct.block* %334, null, !dbg !317
  br i1 %335, label %336, label %357, !dbg !319

336:                                              ; preds = %333, %55
  %337 = add nuw nsw i64 %56, 1, !dbg !320
  call void @llvm.dbg.value(metadata i64 %337, metadata !234, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !233, metadata !DIExpression()), !dbg !236
  %338 = icmp eq i64 %337, 14, !dbg !321
  br i1 %338, label %339, label %55, !dbg !272, !llvm.loop !322

339:                                              ; preds = %336
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !233, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !174, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 %26, metadata !325, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.value(metadata i64 4096, metadata !328, metadata !DIExpression()), !dbg !329
  %340 = icmp ugt i64 %26, 4096, !dbg !333
  %341 = select i1 %340, i64 %26, i64 4096, !dbg !334
  call void @llvm.dbg.value(metadata i64 %341, metadata !173, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata i64 %341, metadata !99, metadata !DIExpression()) #6, !dbg !335
  call void @llvm.dbg.value(metadata i64 %341, metadata !220, metadata !DIExpression()) #6, !dbg !337
  call void @llvm.dbg.value(metadata i64 16, metadata !225, metadata !DIExpression()) #6, !dbg !337
  call void @llvm.dbg.value(metadata i64 %341, metadata !99, metadata !DIExpression()) #6, !dbg !335
  %342 = tail call i8* @mem_sbrk(i64 noundef %341) #6, !dbg !339
  call void @llvm.dbg.value(metadata i8* %342, metadata !104, metadata !DIExpression()) #6, !dbg !335
  %343 = icmp eq i8* %342, inttoptr (i64 -1 to i8*), !dbg !340
  br i1 %343, label %522, label %344, !dbg !341

344:                                              ; preds = %339
  call void @llvm.dbg.value(metadata i8* %342, metadata !114, metadata !DIExpression()) #6, !dbg !342
  %345 = getelementptr inbounds i8, i8* %342, i64 -8, !dbg !344
  %346 = bitcast i8* %345 to %struct.block*, !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* %346, metadata !105, metadata !DIExpression()) #6, !dbg !335
  call void @llvm.dbg.value(metadata %struct.block* %346, metadata !123, metadata !DIExpression()) #6, !dbg !346
  call void @llvm.dbg.value(metadata i64 %341, metadata !128, metadata !DIExpression()) #6, !dbg !346
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !346
  %347 = bitcast i8* %345 to i64*, !dbg !348
  store i64 %341, i64* %347, align 8, !dbg !349, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %346, metadata !137, metadata !DIExpression()) #6, !dbg !350
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !352
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %341), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !354
  %348 = getelementptr inbounds i8, i8* %342, i64 %341, !dbg !356
  %349 = getelementptr inbounds i8, i8* %348, i64 -16, !dbg !357
  %350 = bitcast i8* %349 to i64*, !dbg !358
  call void @llvm.dbg.value(metadata i64* %350, metadata !130, metadata !DIExpression()) #6, !dbg !346
  store i64 %341, i64* %350, align 8, !dbg !359, !tbaa !96
  call void @llvm.dbg.value(metadata %struct.block* %346, metadata !145, metadata !DIExpression()) #6, !dbg !360
  %351 = load i64, i64* %347, align 8, !dbg !362, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !363
  call void @llvm.dbg.value(metadata i64 %351, metadata !301, metadata !DIExpression()) #6, !dbg !365
  %352 = and i64 %351, -16, !dbg !367
  %353 = getelementptr inbounds i8, i8* %345, i64 %352, !dbg !368
  call void @llvm.dbg.value(metadata i8* %353, metadata !106, metadata !DIExpression()) #6, !dbg !335
  call void @llvm.dbg.value(metadata i8* %353, metadata !152, metadata !DIExpression()) #6, !dbg !369
  %354 = bitcast i8* %353 to i64*, !dbg !371
  store i64 1, i64* %354, align 8, !dbg !372, !tbaa !135
  %355 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %346) #6, !dbg !373
  call void @llvm.dbg.value(metadata %struct.block* %355, metadata !105, metadata !DIExpression()) #6, !dbg !335
  call void @llvm.dbg.value(metadata %struct.block* %355, metadata !174, metadata !DIExpression()), !dbg !177
  %356 = icmp eq %struct.block* %355, null, !dbg !374
  br i1 %356, label %522, label %357, !dbg !376

357:                                              ; preds = %333, %60, %72, %86, %100, %114, %128, %142, %156, %170, %184, %198, %212, %226, %240, %254, %268, %282, %296, %310, %324, %329, %344
  %358 = phi %struct.block* [ %355, %344 ], [ %322, %329 ], [ %322, %324 ], [ %308, %310 ], [ %294, %296 ], [ %280, %282 ], [ %266, %268 ], [ %252, %254 ], [ %238, %240 ], [ %224, %226 ], [ %210, %212 ], [ %196, %198 ], [ %182, %184 ], [ %168, %170 ], [ %154, %156 ], [ %140, %142 ], [ %126, %128 ], [ %112, %114 ], [ %98, %100 ], [ %84, %86 ], [ %70, %72 ], [ %58, %60 ], [ %334, %333 ], !dbg !177
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !174, metadata !DIExpression()), !dbg !177
  %359 = getelementptr %struct.block, %struct.block* %358, i64 0, i32 0, !dbg !377
  %360 = load i64, i64* %359, align 8, !dbg !377, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.value(metadata i64 %360, metadata !301, metadata !DIExpression()), !dbg !380
  %361 = and i64 %360, -16, !dbg !382
  call void @llvm.dbg.value(metadata i64 %361, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !123, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.value(metadata i64 %361, metadata !128, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.value(metadata i1 true, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !383
  call void @llvm.dbg.value(metadata i64 %361, metadata !385, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i1 true, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !392
  call void @llvm.dbg.value(metadata i64 %361, metadata !391, metadata !DIExpression()), !dbg !392
  %362 = or i64 %361, 1, !dbg !394
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %361), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !392
  store i64 %362, i64* %359, align 8, !dbg !395, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !137, metadata !DIExpression()), !dbg !396
  %363 = getelementptr inbounds %struct.block, %struct.block* %358, i64 0, i32 1, !dbg !398
  %364 = bitcast %union.anon* %363 to i8*, !dbg !399
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %361), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !402
  %365 = getelementptr inbounds i8, i8* %364, i64 %361, !dbg !404
  %366 = getelementptr inbounds i8, i8* %365, i64 -16, !dbg !405
  %367 = bitcast i8* %366 to i64*, !dbg !406
  call void @llvm.dbg.value(metadata i64* %367, metadata !130, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.value(metadata i64 %361, metadata !385, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.value(metadata i1 true, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !407
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %361), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !407
  store i64 %362, i64* %367, align 8, !dbg !409, !tbaa !96
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !410, metadata !DIExpression()) #6, !dbg !420
  call void @llvm.dbg.value(metadata i64 %26, metadata !415, metadata !DIExpression()) #6, !dbg !420
  %368 = load i64, i64* %359, align 8, !dbg !422, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !423
  call void @llvm.dbg.value(metadata i64 %368, metadata !301, metadata !DIExpression()) #6, !dbg !425
  %369 = and i64 %368, -16, !dbg !427
  call void @llvm.dbg.value(metadata i64 %369, metadata !416, metadata !DIExpression()) #6, !dbg !420
  %370 = sub i64 %369, %26, !dbg !428
  %371 = icmp ugt i64 %370, 31, !dbg !429
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !430, metadata !DIExpression()) #6, !dbg !437
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !430, metadata !DIExpression()) #6, !dbg !439
  call void @llvm.dbg.value(metadata i64 %369, metadata !433, metadata !DIExpression()) #6, !dbg !437
  call void @llvm.dbg.value(metadata i64 %369, metadata !433, metadata !DIExpression()) #6, !dbg !439
  call void @llvm.dbg.value(metadata i64 %369, metadata !238, metadata !DIExpression()) #6, !dbg !442
  call void @llvm.dbg.value(metadata i64 %369, metadata !238, metadata !DIExpression()) #6, !dbg !444
  %372 = icmp ult i64 %369, 32, !dbg !446
  br i1 %371, label %373, label %471, !dbg !447

373:                                              ; preds = %357
  br i1 %372, label %399, label %374, !dbg !448

374:                                              ; preds = %373
  %375 = icmp ult i64 %369, 64
  br i1 %375, label %399, label %376, !dbg !449

376:                                              ; preds = %374
  %377 = icmp ult i64 %369, 128
  br i1 %377, label %399, label %378, !dbg !450

378:                                              ; preds = %376
  %379 = icmp ult i64 %369, 256
  br i1 %379, label %399, label %380, !dbg !451

380:                                              ; preds = %378
  %381 = icmp ult i64 %369, 512
  br i1 %381, label %399, label %382, !dbg !452

382:                                              ; preds = %380
  %383 = icmp ult i64 %369, 1024
  br i1 %383, label %399, label %384, !dbg !453

384:                                              ; preds = %382
  %385 = icmp ult i64 %369, 2048
  br i1 %385, label %399, label %386, !dbg !454

386:                                              ; preds = %384
  %387 = icmp ult i64 %369, 4096
  br i1 %387, label %399, label %388, !dbg !455

388:                                              ; preds = %386
  %389 = icmp ult i64 %369, 8192
  br i1 %389, label %399, label %390, !dbg !456

390:                                              ; preds = %388
  %391 = icmp ult i64 %369, 16384
  br i1 %391, label %399, label %392, !dbg !457

392:                                              ; preds = %390
  %393 = icmp ult i64 %369, 32768
  br i1 %393, label %399, label %394, !dbg !458

394:                                              ; preds = %392
  %395 = icmp ult i64 %369, 65536
  br i1 %395, label %399, label %396, !dbg !459

396:                                              ; preds = %394
  %397 = icmp ult i64 %369, 131072
  %398 = select i1 %397, i64 12, i64 13, !dbg !460
  br label %399, !dbg !460

399:                                              ; preds = %396, %394, %392, %390, %388, %386, %384, %382, %380, %378, %376, %374, %373
  %400 = phi i64 [ 0, %373 ], [ 1, %374 ], [ 2, %376 ], [ 3, %378 ], [ 4, %380 ], [ 5, %382 ], [ 6, %384 ], [ 7, %386 ], [ 8, %388 ], [ 9, %390 ], [ 10, %392 ], [ 11, %394 ], [ %398, %396 ], !dbg !461
  call void @llvm.dbg.value(metadata i64 %400, metadata !434, metadata !DIExpression()) #6, !dbg !437
  %401 = getelementptr inbounds %struct.block, %struct.block* %358, i64 0, i32 1, i32 0, i32 0, !dbg !462
  %402 = load %struct.block*, %struct.block** %401, align 8, !dbg !462, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %402, metadata !435, metadata !DIExpression()) #6, !dbg !437
  %403 = getelementptr inbounds %struct.block, %struct.block* %358, i64 0, i32 1, i32 0, i32 1, !dbg !463
  %404 = load %struct.block*, %struct.block** %403, align 8, !dbg !463, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %404, metadata !436, metadata !DIExpression()) #6, !dbg !437
  %405 = icmp eq %struct.block* %402, null, !dbg !464
  %406 = icmp eq %struct.block* %404, null, !dbg !466
  br i1 %405, label %407, label %412, !dbg !467

407:                                              ; preds = %399
  %408 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %400, !dbg !468
  br i1 %406, label %409, label %410, !dbg !471

409:                                              ; preds = %407
  store %struct.block* null, %struct.block** %408, align 8, !dbg !472, !tbaa !89
  br label %418, !dbg !474

410:                                              ; preds = %407
  store %struct.block* %404, %struct.block** %408, align 8, !dbg !475, !tbaa !89
  %411 = getelementptr inbounds %struct.block, %struct.block* %404, i64 0, i32 1, i32 0, i32 0, !dbg !477
  store %struct.block* null, %struct.block** %411, align 8, !dbg !478, !tbaa !316
  br label %418

412:                                              ; preds = %399
  br i1 %406, label %413, label %415, !dbg !479

413:                                              ; preds = %412
  %414 = getelementptr inbounds %struct.block, %struct.block* %402, i64 0, i32 1, i32 0, i32 1, !dbg !480
  store %struct.block* null, %struct.block** %414, align 8, !dbg !483, !tbaa !316
  br label %418, !dbg !484

415:                                              ; preds = %412
  %416 = getelementptr inbounds %struct.block, %struct.block* %404, i64 0, i32 1, i32 0, i32 0, !dbg !485
  store %struct.block* %402, %struct.block** %416, align 8, !dbg !487, !tbaa !316
  %417 = getelementptr inbounds %struct.block, %struct.block* %402, i64 0, i32 1, i32 0, i32 1, !dbg !488
  store %struct.block* %404, %struct.block** %417, align 8, !dbg !489, !tbaa !316
  br label %418

418:                                              ; preds = %415, %413, %410, %409
  %419 = bitcast %struct.block** %401 to i8*, !dbg !490
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %419, i8 0, i64 16, i1 false) #6, !dbg !491
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !123, metadata !DIExpression()) #6, !dbg !492
  call void @llvm.dbg.value(metadata i64 %26, metadata !128, metadata !DIExpression()) #6, !dbg !492
  call void @llvm.dbg.value(metadata i1 true, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !492
  call void @llvm.dbg.value(metadata i64 %26, metadata !385, metadata !DIExpression()) #6, !dbg !494
  call void @llvm.dbg.value(metadata i1 true, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !494
  call void @llvm.dbg.value(metadata i64 %26, metadata !391, metadata !DIExpression()) #6, !dbg !494
  %420 = or i64 %26, 1, !dbg !496
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %26), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !494
  store i64 %420, i64* %359, align 8, !dbg !497, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !137, metadata !DIExpression()) #6, !dbg !498
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !500
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %26), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !502
  %421 = getelementptr inbounds i8, i8* %364, i64 %26, !dbg !504
  %422 = getelementptr inbounds i8, i8* %421, i64 -16, !dbg !505
  %423 = bitcast i8* %422 to i64*, !dbg !506
  call void @llvm.dbg.value(metadata i64* %423, metadata !130, metadata !DIExpression()) #6, !dbg !492
  call void @llvm.dbg.value(metadata i64 %26, metadata !385, metadata !DIExpression()) #6, !dbg !507
  call void @llvm.dbg.value(metadata i1 true, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !507
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %26), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !507
  store i64 %420, i64* %423, align 8, !dbg !509, !tbaa !96
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !145, metadata !DIExpression()) #6, !dbg !510
  %424 = bitcast %struct.block* %358 to i8*, !dbg !512
  %425 = load i64, i64* %359, align 8, !dbg !513, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !514
  call void @llvm.dbg.value(metadata i64 %425, metadata !301, metadata !DIExpression()) #6, !dbg !516
  %426 = and i64 %425, -16, !dbg !518
  %427 = getelementptr inbounds i8, i8* %424, i64 %426, !dbg !519
  call void @llvm.dbg.value(metadata i8* %427, metadata !417, metadata !DIExpression()) #6, !dbg !520
  call void @llvm.dbg.value(metadata i8* %427, metadata !123, metadata !DIExpression()) #6, !dbg !521
  call void @llvm.dbg.value(metadata i64 %370, metadata !128, metadata !DIExpression()) #6, !dbg !521
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !521
  call void @llvm.dbg.value(metadata i64 %370, metadata !385, metadata !DIExpression()) #6, !dbg !523
  call void @llvm.dbg.value(metadata i1 false, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !523
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %370), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !523
  %428 = bitcast i8* %427 to i64*, !dbg !525
  store i64 %370, i64* %428, align 8, !dbg !526, !tbaa !135
  call void @llvm.dbg.value(metadata i8* %427, metadata !137, metadata !DIExpression()) #6, !dbg !527
  %429 = getelementptr inbounds i8, i8* %427, i64 8, !dbg !529
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !530
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %370), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !532
  %430 = getelementptr inbounds i8, i8* %429, i64 %370, !dbg !534
  %431 = getelementptr inbounds i8, i8* %430, i64 -16, !dbg !535
  %432 = bitcast i8* %431 to i64*, !dbg !536
  call void @llvm.dbg.value(metadata i64* %432, metadata !130, metadata !DIExpression()) #6, !dbg !521
  call void @llvm.dbg.value(metadata i64 %370, metadata !385, metadata !DIExpression()) #6, !dbg !537
  call void @llvm.dbg.value(metadata i1 false, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !537
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %370), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !537
  store i64 %370, i64* %432, align 8, !dbg !539, !tbaa !96
  call void @llvm.dbg.value(metadata i8* %427, metadata !540, metadata !DIExpression()) #6, !dbg !545
  call void @llvm.dbg.value(metadata i64 %370, metadata !543, metadata !DIExpression()) #6, !dbg !545
  call void @llvm.dbg.value(metadata i64 %370, metadata !238, metadata !DIExpression()) #6, !dbg !547
  %433 = icmp ult i64 %370, 64
  br i1 %433, label %457, label %434, !dbg !549

434:                                              ; preds = %418
  %435 = icmp ult i64 %370, 128
  br i1 %435, label %457, label %436, !dbg !550

436:                                              ; preds = %434
  %437 = icmp ult i64 %370, 256
  br i1 %437, label %457, label %438, !dbg !551

438:                                              ; preds = %436
  %439 = icmp ult i64 %370, 512
  br i1 %439, label %457, label %440, !dbg !552

440:                                              ; preds = %438
  %441 = icmp ult i64 %370, 1024
  br i1 %441, label %457, label %442, !dbg !553

442:                                              ; preds = %440
  %443 = icmp ult i64 %370, 2048
  br i1 %443, label %457, label %444, !dbg !554

444:                                              ; preds = %442
  %445 = icmp ult i64 %370, 4096
  br i1 %445, label %457, label %446, !dbg !555

446:                                              ; preds = %444
  %447 = icmp ult i64 %370, 8192
  br i1 %447, label %457, label %448, !dbg !556

448:                                              ; preds = %446
  %449 = icmp ult i64 %370, 16384
  br i1 %449, label %457, label %450, !dbg !557

450:                                              ; preds = %448
  %451 = icmp ult i64 %370, 32768
  br i1 %451, label %457, label %452, !dbg !558

452:                                              ; preds = %450
  %453 = icmp ult i64 %370, 65536
  br i1 %453, label %457, label %454, !dbg !559

454:                                              ; preds = %452
  %455 = icmp ult i64 %370, 131072
  %456 = select i1 %455, i64 12, i64 13, !dbg !560
  br label %457, !dbg !560

457:                                              ; preds = %454, %452, %450, %448, %446, %444, %442, %440, %438, %436, %434, %418
  %458 = phi i64 [ 1, %418 ], [ 2, %434 ], [ 3, %436 ], [ 4, %438 ], [ 5, %440 ], [ 6, %442 ], [ 7, %444 ], [ 8, %446 ], [ 9, %448 ], [ 10, %450 ], [ 11, %452 ], [ %456, %454 ], !dbg !561
  call void @llvm.dbg.value(metadata i64 %458, metadata !544, metadata !DIExpression()) #6, !dbg !545
  %459 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %458, !dbg !562
  %460 = load %struct.block*, %struct.block** %459, align 8, !dbg !562, !tbaa !89
  %461 = icmp eq %struct.block* %460, null, !dbg !564
  br i1 %461, label %462, label %463, !dbg !565

462:                                              ; preds = %457
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %429, i8 0, i64 16, i1 false) #6, !dbg !566
  br label %469, !dbg !568

463:                                              ; preds = %457
  %464 = bitcast i8* %429 to %struct.block**, !dbg !569
  store %struct.block* null, %struct.block** %464, align 8, !dbg !570, !tbaa !316
  %465 = getelementptr inbounds i8, i8* %427, i64 16, !dbg !572
  %466 = bitcast i8* %465 to %struct.block**, !dbg !572
  store %struct.block* %460, %struct.block** %466, align 8, !dbg !573, !tbaa !316
  %467 = getelementptr inbounds %struct.block, %struct.block* %460, i64 0, i32 1, i32 0, i32 0, !dbg !574
  %468 = bitcast %struct.block** %467 to i8**, !dbg !575
  store i8* %427, i8** %468, align 8, !dbg !575, !tbaa !316
  br label %469

469:                                              ; preds = %463, %462
  %470 = bitcast %struct.block** %459 to i8**, !dbg !569
  store i8* %427, i8** %470, align 8, !dbg !569, !tbaa !89
  br label %522, !dbg !576

471:                                              ; preds = %357
  br i1 %372, label %497, label %472, !dbg !577

472:                                              ; preds = %471
  %473 = icmp ult i64 %369, 64
  br i1 %473, label %497, label %474, !dbg !578

474:                                              ; preds = %472
  %475 = icmp ult i64 %369, 128
  br i1 %475, label %497, label %476, !dbg !579

476:                                              ; preds = %474
  %477 = icmp ult i64 %369, 256
  br i1 %477, label %497, label %478, !dbg !580

478:                                              ; preds = %476
  %479 = icmp ult i64 %369, 512
  br i1 %479, label %497, label %480, !dbg !581

480:                                              ; preds = %478
  %481 = icmp ult i64 %369, 1024
  br i1 %481, label %497, label %482, !dbg !582

482:                                              ; preds = %480
  %483 = icmp ult i64 %369, 2048
  br i1 %483, label %497, label %484, !dbg !583

484:                                              ; preds = %482
  %485 = icmp ult i64 %369, 4096
  br i1 %485, label %497, label %486, !dbg !584

486:                                              ; preds = %484
  %487 = icmp ult i64 %369, 8192
  br i1 %487, label %497, label %488, !dbg !585

488:                                              ; preds = %486
  %489 = icmp ult i64 %369, 16384
  br i1 %489, label %497, label %490, !dbg !586

490:                                              ; preds = %488
  %491 = icmp ult i64 %369, 32768
  br i1 %491, label %497, label %492, !dbg !587

492:                                              ; preds = %490
  %493 = icmp ult i64 %369, 65536
  br i1 %493, label %497, label %494, !dbg !588

494:                                              ; preds = %492
  %495 = icmp ult i64 %369, 131072
  %496 = select i1 %495, i64 12, i64 13, !dbg !589
  br label %497, !dbg !589

497:                                              ; preds = %494, %492, %490, %488, %486, %484, %482, %480, %478, %476, %474, %472, %471
  %498 = phi i64 [ 0, %471 ], [ 1, %472 ], [ 2, %474 ], [ 3, %476 ], [ 4, %478 ], [ 5, %480 ], [ 6, %482 ], [ 7, %484 ], [ 8, %486 ], [ 9, %488 ], [ 10, %490 ], [ 11, %492 ], [ %496, %494 ], !dbg !590
  call void @llvm.dbg.value(metadata i64 %498, metadata !434, metadata !DIExpression()) #6, !dbg !439
  %499 = getelementptr inbounds %struct.block, %struct.block* %358, i64 0, i32 1, i32 0, i32 0, !dbg !591
  %500 = load %struct.block*, %struct.block** %499, align 8, !dbg !591, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %500, metadata !435, metadata !DIExpression()) #6, !dbg !439
  %501 = getelementptr inbounds %struct.block, %struct.block* %358, i64 0, i32 1, i32 0, i32 1, !dbg !592
  %502 = load %struct.block*, %struct.block** %501, align 8, !dbg !592, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %502, metadata !436, metadata !DIExpression()) #6, !dbg !439
  %503 = icmp eq %struct.block* %500, null, !dbg !593
  %504 = icmp eq %struct.block* %502, null, !dbg !594
  br i1 %503, label %505, label %510, !dbg !595

505:                                              ; preds = %497
  %506 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %498, !dbg !596
  br i1 %504, label %507, label %508, !dbg !597

507:                                              ; preds = %505
  store %struct.block* null, %struct.block** %506, align 8, !dbg !598, !tbaa !89
  br label %516, !dbg !599

508:                                              ; preds = %505
  store %struct.block* %502, %struct.block** %506, align 8, !dbg !600, !tbaa !89
  %509 = getelementptr inbounds %struct.block, %struct.block* %502, i64 0, i32 1, i32 0, i32 0, !dbg !601
  store %struct.block* null, %struct.block** %509, align 8, !dbg !602, !tbaa !316
  br label %516

510:                                              ; preds = %497
  br i1 %504, label %511, label %513, !dbg !603

511:                                              ; preds = %510
  %512 = getelementptr inbounds %struct.block, %struct.block* %500, i64 0, i32 1, i32 0, i32 1, !dbg !604
  store %struct.block* null, %struct.block** %512, align 8, !dbg !605, !tbaa !316
  br label %516, !dbg !606

513:                                              ; preds = %510
  %514 = getelementptr inbounds %struct.block, %struct.block* %502, i64 0, i32 1, i32 0, i32 0, !dbg !607
  store %struct.block* %500, %struct.block** %514, align 8, !dbg !608, !tbaa !316
  %515 = getelementptr inbounds %struct.block, %struct.block* %500, i64 0, i32 1, i32 0, i32 1, !dbg !609
  store %struct.block* %502, %struct.block** %515, align 8, !dbg !610, !tbaa !316
  br label %516

516:                                              ; preds = %513, %511, %508, %507
  %517 = bitcast %struct.block** %499 to i8*, !dbg !611
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %517, i8 0, i64 16, i1 false) #6, !dbg !612
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !123, metadata !DIExpression()) #6, !dbg !613
  call void @llvm.dbg.value(metadata i64 %369, metadata !128, metadata !DIExpression()) #6, !dbg !613
  call void @llvm.dbg.value(metadata i1 true, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !613
  call void @llvm.dbg.value(metadata i64 %369, metadata !385, metadata !DIExpression()) #6, !dbg !615
  call void @llvm.dbg.value(metadata i1 true, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !615
  call void @llvm.dbg.value(metadata i64 %369, metadata !391, metadata !DIExpression()) #6, !dbg !615
  %518 = or i64 %369, 1, !dbg !617
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %369), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !615
  store i64 %518, i64* %359, align 8, !dbg !618, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %358, metadata !137, metadata !DIExpression()) #6, !dbg !619
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !621
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %369), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !623
  %519 = getelementptr inbounds i8, i8* %364, i64 %369, !dbg !625
  %520 = getelementptr inbounds i8, i8* %519, i64 -16, !dbg !626
  %521 = bitcast i8* %520 to i64*, !dbg !627
  call void @llvm.dbg.value(metadata i64* %521, metadata !130, metadata !DIExpression()) #6, !dbg !613
  call void @llvm.dbg.value(metadata i64 %369, metadata !385, metadata !DIExpression()) #6, !dbg !628
  call void @llvm.dbg.value(metadata i1 true, metadata !390, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !628
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 %369), metadata !391, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !628
  store i64 %518, i64* %521, align 8, !dbg !630, !tbaa !96
  br label %522

522:                                              ; preds = %339, %7, %4, %516, %469, %344, %22, %12
  %523 = phi i8* [ null, %12 ], [ null, %22 ], [ null, %344 ], [ %364, %469 ], [ %364, %516 ], [ null, %4 ], [ null, %7 ], [ null, %339 ], !dbg !177
  ret i8* %523, !dbg !631
}

; Function Attrs: mustprogress nofree nosync nounwind uwtable willreturn
define dso_local void @mm_free(i8* noundef %0) local_unnamed_addr #3 !dbg !632 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !636, metadata !DIExpression()), !dbg !639
  %2 = icmp eq i8* %0, null, !dbg !640
  br i1 %2, label %13, label %3, !dbg !642

3:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i8* %0, metadata !114, metadata !DIExpression()), !dbg !643
  %4 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !645
  %5 = bitcast i8* %4 to %struct.block*, !dbg !646
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !637, metadata !DIExpression()), !dbg !639
  %6 = bitcast i8* %4 to i64*, !dbg !647
  %7 = load i64, i64* %6, align 8, !dbg !647, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !648
  call void @llvm.dbg.value(metadata i64 %7, metadata !301, metadata !DIExpression()), !dbg !650
  %8 = and i64 %7, -16, !dbg !652
  call void @llvm.dbg.value(metadata i64 %8, metadata !638, metadata !DIExpression()), !dbg !639
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !123, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i64 %8, metadata !128, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !653
  store i64 %8, i64* %6, align 8, !dbg !655, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !137, metadata !DIExpression()), !dbg !656
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !658
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %8), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !660
  %9 = getelementptr inbounds i8, i8* %0, i64 %8, !dbg !662
  %10 = getelementptr inbounds i8, i8* %9, i64 -16, !dbg !663
  %11 = bitcast i8* %10 to i64*, !dbg !664
  call void @llvm.dbg.value(metadata i64* %11, metadata !130, metadata !DIExpression()), !dbg !653
  store i64 %8, i64* %11, align 8, !dbg !665, !tbaa !96
  %12 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %5), !dbg !666
  br label %13

13:                                               ; preds = %1, %3
  ret void, !dbg !667
}

; Function Attrs: mustprogress nofree nosync nounwind uwtable willreturn
define internal fastcc %struct.block* @coalesce_block(%struct.block* noundef %0) unnamed_addr #3 !dbg !668 {
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !670, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !145, metadata !DIExpression()), !dbg !679
  %2 = bitcast %struct.block* %0 to i8*, !dbg !681
  %3 = getelementptr %struct.block, %struct.block* %0, i64 0, i32 0, !dbg !682
  %4 = load i64, i64* %3, align 8, !dbg !682, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !683
  call void @llvm.dbg.value(metadata i64 %4, metadata !301, metadata !DIExpression()), !dbg !685
  %5 = and i64 %4, -16, !dbg !687
  %6 = getelementptr inbounds i8, i8* %2, i64 %5, !dbg !688
  call void @llvm.dbg.value(metadata i8* %6, metadata !671, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !689, metadata !DIExpression()), !dbg !693
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !695, metadata !DIExpression()), !dbg !698
  %7 = getelementptr inbounds i64, i64* %3, i64 -1, !dbg !700
  call void @llvm.dbg.value(metadata i64* %7, metadata !692, metadata !DIExpression()), !dbg !693
  call void @llvm.dbg.value(metadata i64* %7, metadata !701, metadata !DIExpression()), !dbg !707
  %8 = load i64, i64* %7, align 8, !dbg !709, !tbaa !96
  call void @llvm.dbg.value(metadata i64 %8, metadata !301, metadata !DIExpression()), !dbg !710
  %9 = and i64 %8, -16, !dbg !712
  call void @llvm.dbg.value(metadata i64 %9, metadata !706, metadata !DIExpression()), !dbg !707
  %10 = icmp eq i64 %9, 0, !dbg !713
  %11 = bitcast i64* %7 to %struct.block*, !dbg !715
  %12 = sub i64 0, %9, !dbg !715
  %13 = getelementptr inbounds i8, i8* %2, i64 %12, !dbg !715
  %14 = bitcast i8* %13 to %struct.block*, !dbg !715
  %15 = select i1 %10, %struct.block* %11, %struct.block* %14, !dbg !715
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !672, metadata !DIExpression()), !dbg !678
  %16 = bitcast i8* %6 to i64*, !dbg !716
  %17 = load i64, i64* %16, align 8, !dbg !716, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !717, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.value(metadata i64 %17, metadata !724, metadata !DIExpression()), !dbg !729
  %18 = and i64 %17, 1, !dbg !731
  %19 = icmp ne i64 %18, 0, !dbg !732
  call void @llvm.dbg.value(metadata i1 %19, metadata !673, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !678
  %20 = getelementptr %struct.block, %struct.block* %15, i64 0, i32 0, !dbg !733
  %21 = load i64, i64* %20, align 8, !dbg !733, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !717, metadata !DIExpression()), !dbg !734
  call void @llvm.dbg.value(metadata i64 %21, metadata !724, metadata !DIExpression()), !dbg !736
  %22 = and i64 %21, 1, !dbg !738
  %23 = icmp ne i64 %22, 0, !dbg !739
  call void @llvm.dbg.value(metadata i1 %23, metadata !674, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !740
  call void @llvm.dbg.value(metadata i64 %4, metadata !301, metadata !DIExpression()), !dbg !742
  call void @llvm.dbg.value(metadata i64 %5, metadata !675, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata i64 %17, metadata !301, metadata !DIExpression()), !dbg !746
  %24 = and i64 %17, -16, !dbg !748
  call void @llvm.dbg.value(metadata i64 %24, metadata !676, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i64 %21, metadata !301, metadata !DIExpression()), !dbg !751
  %25 = and i64 %21, -16, !dbg !753
  call void @llvm.dbg.value(metadata i64 %25, metadata !677, metadata !DIExpression()), !dbg !678
  %26 = xor i1 %23, true, !dbg !754
  %27 = xor i1 %19, true, !dbg !754
  %28 = select i1 %26, i1 true, i1 %27, !dbg !754
  br i1 %28, label %30, label %29, !dbg !754

29:                                               ; preds = %1
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !123, metadata !DIExpression()), !dbg !756
  call void @llvm.dbg.value(metadata i64 %5, metadata !128, metadata !DIExpression()), !dbg !756
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !756
  store i64 %5, i64* %3, align 8, !dbg !759, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !137, metadata !DIExpression()), !dbg !760
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !762
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %5), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !764
  call void @llvm.dbg.value(metadata i64* undef, metadata !130, metadata !DIExpression()), !dbg !756
  br label %233, !dbg !766

30:                                               ; preds = %1
  %31 = select i1 %26, i1 true, i1 %19, !dbg !767
  br i1 %31, label %82, label %32, !dbg !767

32:                                               ; preds = %30
  %33 = add i64 %24, %5, !dbg !769
  call void @llvm.dbg.value(metadata i64 %33, metadata !675, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i8* %6, metadata !430, metadata !DIExpression()) #6, !dbg !771
  call void @llvm.dbg.value(metadata i64 %24, metadata !433, metadata !DIExpression()) #6, !dbg !771
  call void @llvm.dbg.value(metadata i64 %24, metadata !238, metadata !DIExpression()) #6, !dbg !773
  %34 = icmp ult i64 %24, 32, !dbg !775
  br i1 %34, label %60, label %35, !dbg !776

35:                                               ; preds = %32
  %36 = icmp ult i64 %24, 64
  br i1 %36, label %60, label %37, !dbg !777

37:                                               ; preds = %35
  %38 = icmp ult i64 %24, 128
  br i1 %38, label %60, label %39, !dbg !778

39:                                               ; preds = %37
  %40 = icmp ult i64 %24, 256
  br i1 %40, label %60, label %41, !dbg !779

41:                                               ; preds = %39
  %42 = icmp ult i64 %24, 512
  br i1 %42, label %60, label %43, !dbg !780

43:                                               ; preds = %41
  %44 = icmp ult i64 %24, 1024
  br i1 %44, label %60, label %45, !dbg !781

45:                                               ; preds = %43
  %46 = icmp ult i64 %24, 2048
  br i1 %46, label %60, label %47, !dbg !782

47:                                               ; preds = %45
  %48 = icmp ult i64 %24, 4096
  br i1 %48, label %60, label %49, !dbg !783

49:                                               ; preds = %47
  %50 = icmp ult i64 %24, 8192
  br i1 %50, label %60, label %51, !dbg !784

51:                                               ; preds = %49
  %52 = icmp ult i64 %24, 16384
  br i1 %52, label %60, label %53, !dbg !785

53:                                               ; preds = %51
  %54 = icmp ult i64 %24, 32768
  br i1 %54, label %60, label %55, !dbg !786

55:                                               ; preds = %53
  %56 = icmp ult i64 %24, 65536
  br i1 %56, label %60, label %57, !dbg !787

57:                                               ; preds = %55
  %58 = icmp ult i64 %24, 131072
  %59 = select i1 %58, i64 12, i64 13, !dbg !788
  br label %60, !dbg !788

60:                                               ; preds = %57, %55, %53, %51, %49, %47, %45, %43, %41, %39, %37, %35, %32
  %61 = phi i64 [ 0, %32 ], [ 1, %35 ], [ 2, %37 ], [ 3, %39 ], [ 4, %41 ], [ 5, %43 ], [ 6, %45 ], [ 7, %47 ], [ 8, %49 ], [ 9, %51 ], [ 10, %53 ], [ 11, %55 ], [ %59, %57 ], !dbg !789
  call void @llvm.dbg.value(metadata i64 %61, metadata !434, metadata !DIExpression()) #6, !dbg !771
  %62 = getelementptr inbounds i8, i8* %6, i64 8, !dbg !790
  %63 = bitcast i8* %62 to %struct.block**, !dbg !790
  %64 = load %struct.block*, %struct.block** %63, align 8, !dbg !790, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %64, metadata !435, metadata !DIExpression()) #6, !dbg !771
  %65 = getelementptr inbounds i8, i8* %6, i64 16, !dbg !791
  %66 = bitcast i8* %65 to %struct.block**, !dbg !791
  %67 = load %struct.block*, %struct.block** %66, align 8, !dbg !791, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %67, metadata !436, metadata !DIExpression()) #6, !dbg !771
  %68 = icmp eq %struct.block* %64, null, !dbg !792
  %69 = icmp eq %struct.block* %67, null, !dbg !793
  br i1 %68, label %70, label %75, !dbg !794

70:                                               ; preds = %60
  %71 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %61, !dbg !795
  br i1 %69, label %72, label %73, !dbg !796

72:                                               ; preds = %70
  store %struct.block* null, %struct.block** %71, align 8, !dbg !797, !tbaa !89
  br label %81, !dbg !798

73:                                               ; preds = %70
  store %struct.block* %67, %struct.block** %71, align 8, !dbg !799, !tbaa !89
  %74 = getelementptr inbounds %struct.block, %struct.block* %67, i64 0, i32 1, i32 0, i32 0, !dbg !800
  store %struct.block* null, %struct.block** %74, align 8, !dbg !801, !tbaa !316
  br label %81

75:                                               ; preds = %60
  br i1 %69, label %76, label %78, !dbg !802

76:                                               ; preds = %75
  %77 = getelementptr inbounds %struct.block, %struct.block* %64, i64 0, i32 1, i32 0, i32 1, !dbg !803
  store %struct.block* null, %struct.block** %77, align 8, !dbg !804, !tbaa !316
  br label %81, !dbg !805

78:                                               ; preds = %75
  %79 = getelementptr inbounds %struct.block, %struct.block* %67, i64 0, i32 1, i32 0, i32 0, !dbg !806
  store %struct.block* %64, %struct.block** %79, align 8, !dbg !807, !tbaa !316
  %80 = getelementptr inbounds %struct.block, %struct.block* %64, i64 0, i32 1, i32 0, i32 1, !dbg !808
  store %struct.block* %67, %struct.block** %80, align 8, !dbg !809, !tbaa !316
  br label %81

81:                                               ; preds = %72, %73, %76, %78
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %62, i8 0, i64 16, i1 false) #6, !dbg !810
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !123, metadata !DIExpression()), !dbg !811
  call void @llvm.dbg.value(metadata i64 %33, metadata !128, metadata !DIExpression()), !dbg !811
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !811
  store i64 %33, i64* %3, align 8, !dbg !813, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !137, metadata !DIExpression()), !dbg !814
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !816
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %33), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !818
  call void @llvm.dbg.value(metadata i64* %240, metadata !130, metadata !DIExpression()), !dbg !811
  br label %233, !dbg !820

82:                                               ; preds = %30
  %83 = select i1 %23, i1 true, i1 %27, !dbg !821
  br i1 %83, label %133, label %84, !dbg !821

84:                                               ; preds = %82
  %85 = add i64 %25, %5, !dbg !823
  call void @llvm.dbg.value(metadata i64 %85, metadata !675, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !430, metadata !DIExpression()) #6, !dbg !825
  call void @llvm.dbg.value(metadata i64 %25, metadata !433, metadata !DIExpression()) #6, !dbg !825
  call void @llvm.dbg.value(metadata i64 %25, metadata !238, metadata !DIExpression()) #6, !dbg !827
  %86 = icmp ult i64 %25, 32, !dbg !829
  br i1 %86, label %112, label %87, !dbg !830

87:                                               ; preds = %84
  %88 = icmp ult i64 %25, 64
  br i1 %88, label %112, label %89, !dbg !831

89:                                               ; preds = %87
  %90 = icmp ult i64 %25, 128
  br i1 %90, label %112, label %91, !dbg !832

91:                                               ; preds = %89
  %92 = icmp ult i64 %25, 256
  br i1 %92, label %112, label %93, !dbg !833

93:                                               ; preds = %91
  %94 = icmp ult i64 %25, 512
  br i1 %94, label %112, label %95, !dbg !834

95:                                               ; preds = %93
  %96 = icmp ult i64 %25, 1024
  br i1 %96, label %112, label %97, !dbg !835

97:                                               ; preds = %95
  %98 = icmp ult i64 %25, 2048
  br i1 %98, label %112, label %99, !dbg !836

99:                                               ; preds = %97
  %100 = icmp ult i64 %25, 4096
  br i1 %100, label %112, label %101, !dbg !837

101:                                              ; preds = %99
  %102 = icmp ult i64 %25, 8192
  br i1 %102, label %112, label %103, !dbg !838

103:                                              ; preds = %101
  %104 = icmp ult i64 %25, 16384
  br i1 %104, label %112, label %105, !dbg !839

105:                                              ; preds = %103
  %106 = icmp ult i64 %25, 32768
  br i1 %106, label %112, label %107, !dbg !840

107:                                              ; preds = %105
  %108 = icmp ult i64 %25, 65536
  br i1 %108, label %112, label %109, !dbg !841

109:                                              ; preds = %107
  %110 = icmp ult i64 %25, 131072
  %111 = select i1 %110, i64 12, i64 13, !dbg !842
  br label %112, !dbg !842

112:                                              ; preds = %109, %107, %105, %103, %101, %99, %97, %95, %93, %91, %89, %87, %84
  %113 = phi i64 [ 0, %84 ], [ 1, %87 ], [ 2, %89 ], [ 3, %91 ], [ 4, %93 ], [ 5, %95 ], [ 6, %97 ], [ 7, %99 ], [ 8, %101 ], [ 9, %103 ], [ 10, %105 ], [ 11, %107 ], [ %111, %109 ], !dbg !843
  call void @llvm.dbg.value(metadata i64 %113, metadata !434, metadata !DIExpression()) #6, !dbg !825
  %114 = getelementptr inbounds %struct.block, %struct.block* %15, i64 0, i32 1, i32 0, i32 0, !dbg !844
  %115 = load %struct.block*, %struct.block** %114, align 8, !dbg !844, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %115, metadata !435, metadata !DIExpression()) #6, !dbg !825
  %116 = getelementptr inbounds %struct.block, %struct.block* %15, i64 0, i32 1, i32 0, i32 1, !dbg !845
  %117 = load %struct.block*, %struct.block** %116, align 8, !dbg !845, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %117, metadata !436, metadata !DIExpression()) #6, !dbg !825
  %118 = icmp eq %struct.block* %115, null, !dbg !846
  %119 = icmp eq %struct.block* %117, null, !dbg !847
  br i1 %118, label %120, label %125, !dbg !848

120:                                              ; preds = %112
  %121 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %113, !dbg !849
  br i1 %119, label %122, label %123, !dbg !850

122:                                              ; preds = %120
  store %struct.block* null, %struct.block** %121, align 8, !dbg !851, !tbaa !89
  br label %131, !dbg !852

123:                                              ; preds = %120
  store %struct.block* %117, %struct.block** %121, align 8, !dbg !853, !tbaa !89
  %124 = getelementptr inbounds %struct.block, %struct.block* %117, i64 0, i32 1, i32 0, i32 0, !dbg !854
  store %struct.block* null, %struct.block** %124, align 8, !dbg !855, !tbaa !316
  br label %131

125:                                              ; preds = %112
  br i1 %119, label %126, label %128, !dbg !856

126:                                              ; preds = %125
  %127 = getelementptr inbounds %struct.block, %struct.block* %115, i64 0, i32 1, i32 0, i32 1, !dbg !857
  store %struct.block* null, %struct.block** %127, align 8, !dbg !858, !tbaa !316
  br label %131, !dbg !859

128:                                              ; preds = %125
  %129 = getelementptr inbounds %struct.block, %struct.block* %117, i64 0, i32 1, i32 0, i32 0, !dbg !860
  store %struct.block* %115, %struct.block** %129, align 8, !dbg !861, !tbaa !316
  %130 = getelementptr inbounds %struct.block, %struct.block* %115, i64 0, i32 1, i32 0, i32 1, !dbg !862
  store %struct.block* %117, %struct.block** %130, align 8, !dbg !863, !tbaa !316
  br label %131

131:                                              ; preds = %122, %123, %126, %128
  %132 = bitcast %struct.block** %114 to i8*, !dbg !864
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %132, i8 0, i64 16, i1 false) #6, !dbg !865
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !123, metadata !DIExpression()), !dbg !866
  call void @llvm.dbg.value(metadata i64 %85, metadata !128, metadata !DIExpression()), !dbg !866
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !866
  store i64 %85, i64* %20, align 8, !dbg !868, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !137, metadata !DIExpression()), !dbg !869
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !871
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %85), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !873
  call void @llvm.dbg.value(metadata i64* undef, metadata !130, metadata !DIExpression()), !dbg !866
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !670, metadata !DIExpression()), !dbg !678
  br label %233, !dbg !875

133:                                              ; preds = %82
  %134 = select i1 %23, i1 true, i1 %19, !dbg !876
  br i1 %134, label %241, label %135, !dbg !876

135:                                              ; preds = %133
  %136 = add i64 %24, %5, !dbg !878
  %137 = add i64 %136, %25, !dbg !880
  call void @llvm.dbg.value(metadata i64 %137, metadata !675, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !430, metadata !DIExpression()) #6, !dbg !881
  call void @llvm.dbg.value(metadata i64 %25, metadata !433, metadata !DIExpression()) #6, !dbg !881
  call void @llvm.dbg.value(metadata i64 %25, metadata !238, metadata !DIExpression()) #6, !dbg !883
  %138 = icmp ult i64 %25, 32, !dbg !885
  br i1 %138, label %164, label %139, !dbg !886

139:                                              ; preds = %135
  %140 = icmp ult i64 %25, 64
  br i1 %140, label %164, label %141, !dbg !887

141:                                              ; preds = %139
  %142 = icmp ult i64 %25, 128
  br i1 %142, label %164, label %143, !dbg !888

143:                                              ; preds = %141
  %144 = icmp ult i64 %25, 256
  br i1 %144, label %164, label %145, !dbg !889

145:                                              ; preds = %143
  %146 = icmp ult i64 %25, 512
  br i1 %146, label %164, label %147, !dbg !890

147:                                              ; preds = %145
  %148 = icmp ult i64 %25, 1024
  br i1 %148, label %164, label %149, !dbg !891

149:                                              ; preds = %147
  %150 = icmp ult i64 %25, 2048
  br i1 %150, label %164, label %151, !dbg !892

151:                                              ; preds = %149
  %152 = icmp ult i64 %25, 4096
  br i1 %152, label %164, label %153, !dbg !893

153:                                              ; preds = %151
  %154 = icmp ult i64 %25, 8192
  br i1 %154, label %164, label %155, !dbg !894

155:                                              ; preds = %153
  %156 = icmp ult i64 %25, 16384
  br i1 %156, label %164, label %157, !dbg !895

157:                                              ; preds = %155
  %158 = icmp ult i64 %25, 32768
  br i1 %158, label %164, label %159, !dbg !896

159:                                              ; preds = %157
  %160 = icmp ult i64 %25, 65536
  br i1 %160, label %164, label %161, !dbg !897

161:                                              ; preds = %159
  %162 = icmp ult i64 %25, 131072
  %163 = select i1 %162, i64 12, i64 13, !dbg !898
  br label %164, !dbg !898

164:                                              ; preds = %161, %159, %157, %155, %153, %151, %149, %147, %145, %143, %141, %139, %135
  %165 = phi i64 [ 0, %135 ], [ 1, %139 ], [ 2, %141 ], [ 3, %143 ], [ 4, %145 ], [ 5, %147 ], [ 6, %149 ], [ 7, %151 ], [ 8, %153 ], [ 9, %155 ], [ 10, %157 ], [ 11, %159 ], [ %163, %161 ], !dbg !899
  call void @llvm.dbg.value(metadata i64 %165, metadata !434, metadata !DIExpression()) #6, !dbg !881
  %166 = getelementptr inbounds %struct.block, %struct.block* %15, i64 0, i32 1, i32 0, i32 0, !dbg !900
  %167 = load %struct.block*, %struct.block** %166, align 8, !dbg !900, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %167, metadata !435, metadata !DIExpression()) #6, !dbg !881
  %168 = getelementptr inbounds %struct.block, %struct.block* %15, i64 0, i32 1, i32 0, i32 1, !dbg !901
  %169 = load %struct.block*, %struct.block** %168, align 8, !dbg !901, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %169, metadata !436, metadata !DIExpression()) #6, !dbg !881
  %170 = icmp eq %struct.block* %167, null, !dbg !902
  %171 = icmp eq %struct.block* %169, null, !dbg !903
  br i1 %170, label %172, label %177, !dbg !904

172:                                              ; preds = %164
  %173 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %165, !dbg !905
  br i1 %171, label %174, label %175, !dbg !906

174:                                              ; preds = %172
  store %struct.block* null, %struct.block** %173, align 8, !dbg !907, !tbaa !89
  br label %183, !dbg !908

175:                                              ; preds = %172
  store %struct.block* %169, %struct.block** %173, align 8, !dbg !909, !tbaa !89
  %176 = getelementptr inbounds %struct.block, %struct.block* %169, i64 0, i32 1, i32 0, i32 0, !dbg !910
  store %struct.block* null, %struct.block** %176, align 8, !dbg !911, !tbaa !316
  br label %183

177:                                              ; preds = %164
  br i1 %171, label %178, label %180, !dbg !912

178:                                              ; preds = %177
  %179 = getelementptr inbounds %struct.block, %struct.block* %167, i64 0, i32 1, i32 0, i32 1, !dbg !913
  store %struct.block* null, %struct.block** %179, align 8, !dbg !914, !tbaa !316
  br label %183, !dbg !915

180:                                              ; preds = %177
  %181 = getelementptr inbounds %struct.block, %struct.block* %169, i64 0, i32 1, i32 0, i32 0, !dbg !916
  store %struct.block* %167, %struct.block** %181, align 8, !dbg !917, !tbaa !316
  %182 = getelementptr inbounds %struct.block, %struct.block* %167, i64 0, i32 1, i32 0, i32 1, !dbg !918
  store %struct.block* %169, %struct.block** %182, align 8, !dbg !919, !tbaa !316
  br label %183

183:                                              ; preds = %174, %175, %178, %180
  %184 = bitcast %struct.block** %166 to i8*, !dbg !920
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %184, i8 0, i64 16, i1 false) #6, !dbg !921
  call void @llvm.dbg.value(metadata i8* %6, metadata !430, metadata !DIExpression()) #6, !dbg !922
  call void @llvm.dbg.value(metadata i64 %24, metadata !433, metadata !DIExpression()) #6, !dbg !922
  call void @llvm.dbg.value(metadata i64 %24, metadata !238, metadata !DIExpression()) #6, !dbg !924
  %185 = icmp ult i64 %24, 32, !dbg !926
  br i1 %185, label %211, label %186, !dbg !927

186:                                              ; preds = %183
  %187 = icmp ult i64 %24, 64
  br i1 %187, label %211, label %188, !dbg !928

188:                                              ; preds = %186
  %189 = icmp ult i64 %24, 128
  br i1 %189, label %211, label %190, !dbg !929

190:                                              ; preds = %188
  %191 = icmp ult i64 %24, 256
  br i1 %191, label %211, label %192, !dbg !930

192:                                              ; preds = %190
  %193 = icmp ult i64 %24, 512
  br i1 %193, label %211, label %194, !dbg !931

194:                                              ; preds = %192
  %195 = icmp ult i64 %24, 1024
  br i1 %195, label %211, label %196, !dbg !932

196:                                              ; preds = %194
  %197 = icmp ult i64 %24, 2048
  br i1 %197, label %211, label %198, !dbg !933

198:                                              ; preds = %196
  %199 = icmp ult i64 %24, 4096
  br i1 %199, label %211, label %200, !dbg !934

200:                                              ; preds = %198
  %201 = icmp ult i64 %24, 8192
  br i1 %201, label %211, label %202, !dbg !935

202:                                              ; preds = %200
  %203 = icmp ult i64 %24, 16384
  br i1 %203, label %211, label %204, !dbg !936

204:                                              ; preds = %202
  %205 = icmp ult i64 %24, 32768
  br i1 %205, label %211, label %206, !dbg !937

206:                                              ; preds = %204
  %207 = icmp ult i64 %24, 65536
  br i1 %207, label %211, label %208, !dbg !938

208:                                              ; preds = %206
  %209 = icmp ult i64 %24, 131072
  %210 = select i1 %209, i64 12, i64 13, !dbg !939
  br label %211, !dbg !939

211:                                              ; preds = %208, %206, %204, %202, %200, %198, %196, %194, %192, %190, %188, %186, %183
  %212 = phi i64 [ 0, %183 ], [ 1, %186 ], [ 2, %188 ], [ 3, %190 ], [ 4, %192 ], [ 5, %194 ], [ 6, %196 ], [ 7, %198 ], [ 8, %200 ], [ 9, %202 ], [ 10, %204 ], [ 11, %206 ], [ %210, %208 ], !dbg !940
  call void @llvm.dbg.value(metadata i64 %212, metadata !434, metadata !DIExpression()) #6, !dbg !922
  %213 = getelementptr inbounds i8, i8* %6, i64 8, !dbg !941
  %214 = bitcast i8* %213 to %struct.block**, !dbg !941
  %215 = load %struct.block*, %struct.block** %214, align 8, !dbg !941, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %215, metadata !435, metadata !DIExpression()) #6, !dbg !922
  %216 = getelementptr inbounds i8, i8* %6, i64 16, !dbg !942
  %217 = bitcast i8* %216 to %struct.block**, !dbg !942
  %218 = load %struct.block*, %struct.block** %217, align 8, !dbg !942, !tbaa !316
  call void @llvm.dbg.value(metadata %struct.block* %218, metadata !436, metadata !DIExpression()) #6, !dbg !922
  %219 = icmp eq %struct.block* %215, null, !dbg !943
  %220 = icmp eq %struct.block* %218, null, !dbg !944
  br i1 %219, label %221, label %226, !dbg !945

221:                                              ; preds = %211
  %222 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %212, !dbg !946
  br i1 %220, label %223, label %224, !dbg !947

223:                                              ; preds = %221
  store %struct.block* null, %struct.block** %222, align 8, !dbg !948, !tbaa !89
  br label %232, !dbg !949

224:                                              ; preds = %221
  store %struct.block* %218, %struct.block** %222, align 8, !dbg !950, !tbaa !89
  %225 = getelementptr inbounds %struct.block, %struct.block* %218, i64 0, i32 1, i32 0, i32 0, !dbg !951
  store %struct.block* null, %struct.block** %225, align 8, !dbg !952, !tbaa !316
  br label %232

226:                                              ; preds = %211
  br i1 %220, label %227, label %229, !dbg !953

227:                                              ; preds = %226
  %228 = getelementptr inbounds %struct.block, %struct.block* %215, i64 0, i32 1, i32 0, i32 1, !dbg !954
  store %struct.block* null, %struct.block** %228, align 8, !dbg !955, !tbaa !316
  br label %232, !dbg !956

229:                                              ; preds = %226
  %230 = getelementptr inbounds %struct.block, %struct.block* %218, i64 0, i32 1, i32 0, i32 0, !dbg !957
  store %struct.block* %215, %struct.block** %230, align 8, !dbg !958, !tbaa !316
  %231 = getelementptr inbounds %struct.block, %struct.block* %215, i64 0, i32 1, i32 0, i32 1, !dbg !959
  store %struct.block* %218, %struct.block** %231, align 8, !dbg !960, !tbaa !316
  br label %232

232:                                              ; preds = %223, %224, %227, %229
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %213, i8 0, i64 16, i1 false) #6, !dbg !961
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !123, metadata !DIExpression()), !dbg !962
  call void @llvm.dbg.value(metadata i64 %137, metadata !128, metadata !DIExpression()), !dbg !962
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !962
  store i64 %137, i64* %20, align 8, !dbg !964, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !137, metadata !DIExpression()), !dbg !965
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()), !dbg !967
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %137), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !969
  call void @llvm.dbg.value(metadata i64* undef, metadata !130, metadata !DIExpression()), !dbg !962
  call void @llvm.dbg.value(metadata %struct.block* %15, metadata !670, metadata !DIExpression()), !dbg !678
  br label %233, !dbg !971

233:                                              ; preds = %29, %131, %232, %81
  %234 = phi %struct.block* [ %0, %81 ], [ %15, %232 ], [ %15, %131 ], [ %0, %29 ]
  %235 = phi i64 [ %33, %81 ], [ %137, %232 ], [ %85, %131 ], [ %5, %29 ]
  %236 = getelementptr inbounds %struct.block, %struct.block* %234, i64 0, i32 1, !dbg !972
  %237 = bitcast %union.anon* %236 to i8*, !dbg !972
  %238 = getelementptr inbounds i8, i8* %237, i64 %235, !dbg !972
  %239 = getelementptr inbounds i8, i8* %238, i64 -16, !dbg !972
  %240 = bitcast i8* %239 to i64*, !dbg !972
  store i64 %235, i64* %240, align 8, !dbg !972, !tbaa !96
  br label %241, !dbg !973

241:                                              ; preds = %233, %133
  %242 = phi i64 [ %5, %133 ], [ %235, %233 ], !dbg !678
  %243 = phi %struct.block* [ %0, %133 ], [ %234, %233 ]
  call void @llvm.dbg.value(metadata %struct.block* %243, metadata !670, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata i64 %242, metadata !675, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.value(metadata %struct.block* %243, metadata !540, metadata !DIExpression()) #6, !dbg !976
  call void @llvm.dbg.value(metadata i64 %242, metadata !543, metadata !DIExpression()) #6, !dbg !976
  call void @llvm.dbg.value(metadata i64 %242, metadata !238, metadata !DIExpression()) #6, !dbg !977
  %244 = icmp ult i64 %242, 32, !dbg !973
  br i1 %244, label %270, label %245, !dbg !978

245:                                              ; preds = %241
  %246 = icmp ult i64 %242, 64
  br i1 %246, label %270, label %247, !dbg !979

247:                                              ; preds = %245
  %248 = icmp ult i64 %242, 128
  br i1 %248, label %270, label %249, !dbg !980

249:                                              ; preds = %247
  %250 = icmp ult i64 %242, 256
  br i1 %250, label %270, label %251, !dbg !981

251:                                              ; preds = %249
  %252 = icmp ult i64 %242, 512
  br i1 %252, label %270, label %253, !dbg !982

253:                                              ; preds = %251
  %254 = icmp ult i64 %242, 1024
  br i1 %254, label %270, label %255, !dbg !983

255:                                              ; preds = %253
  %256 = icmp ult i64 %242, 2048
  br i1 %256, label %270, label %257, !dbg !984

257:                                              ; preds = %255
  %258 = icmp ult i64 %242, 4096
  br i1 %258, label %270, label %259, !dbg !985

259:                                              ; preds = %257
  %260 = icmp ult i64 %242, 8192
  br i1 %260, label %270, label %261, !dbg !986

261:                                              ; preds = %259
  %262 = icmp ult i64 %242, 16384
  br i1 %262, label %270, label %263, !dbg !987

263:                                              ; preds = %261
  %264 = icmp ult i64 %242, 32768
  br i1 %264, label %270, label %265, !dbg !988

265:                                              ; preds = %263
  %266 = icmp ult i64 %242, 65536
  br i1 %266, label %270, label %267, !dbg !989

267:                                              ; preds = %265
  %268 = icmp ult i64 %242, 131072
  %269 = select i1 %268, i64 12, i64 13, !dbg !990
  br label %270, !dbg !990

270:                                              ; preds = %267, %265, %263, %261, %259, %257, %255, %253, %251, %249, %247, %245, %241
  %271 = phi i64 [ 0, %241 ], [ 1, %245 ], [ 2, %247 ], [ 3, %249 ], [ 4, %251 ], [ 5, %253 ], [ 6, %255 ], [ 7, %257 ], [ 8, %259 ], [ 9, %261 ], [ 10, %263 ], [ 11, %265 ], [ %269, %267 ], !dbg !991
  call void @llvm.dbg.value(metadata i64 %271, metadata !544, metadata !DIExpression()) #6, !dbg !976
  %272 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seglist, i64 0, i64 %271, !dbg !992
  %273 = load %struct.block*, %struct.block** %272, align 8, !dbg !992, !tbaa !89
  %274 = icmp eq %struct.block* %273, null, !dbg !993
  %275 = getelementptr inbounds %struct.block, %struct.block* %243, i64 0, i32 1, i32 0, i32 0, !dbg !994
  br i1 %274, label %276, label %278, !dbg !995

276:                                              ; preds = %270
  %277 = bitcast %struct.block** %275 to i8*, !dbg !996
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %277, i8 0, i64 16, i1 false) #6, !dbg !997
  br label %281, !dbg !996

278:                                              ; preds = %270
  store %struct.block* null, %struct.block** %275, align 8, !dbg !998, !tbaa !316
  %279 = getelementptr inbounds %struct.block, %struct.block* %243, i64 0, i32 1, i32 0, i32 1, !dbg !999
  store %struct.block* %273, %struct.block** %279, align 8, !dbg !1000, !tbaa !316
  %280 = getelementptr inbounds %struct.block, %struct.block* %273, i64 0, i32 1, i32 0, i32 0, !dbg !1001
  store %struct.block* %243, %struct.block** %280, align 8, !dbg !1002, !tbaa !316
  br label %281

281:                                              ; preds = %276, %278
  store %struct.block* %243, %struct.block** %272, align 8, !dbg !994, !tbaa !89
  ret %struct.block* %243, !dbg !1003
}

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_realloc(i8* noundef %0, i64 noundef %1) local_unnamed_addr #1 !dbg !1004 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !1008, metadata !DIExpression()), !dbg !1013
  call void @llvm.dbg.value(metadata i64 %1, metadata !1009, metadata !DIExpression()), !dbg !1013
  call void @llvm.dbg.value(metadata i8* %0, metadata !114, metadata !DIExpression()), !dbg !1014
  %3 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !1016
  %4 = bitcast i8* %3 to %struct.block*, !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !1010, metadata !DIExpression()), !dbg !1013
  %5 = icmp eq i64 %1, 0, !dbg !1018
  %6 = icmp eq i8* %0, null, !dbg !1013
  br i1 %5, label %7, label %12, !dbg !1020

7:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i8* %0, metadata !636, metadata !DIExpression()) #6, !dbg !1021
  br i1 %6, label %33, label %8, !dbg !1024

8:                                                ; preds = %7
  call void @llvm.dbg.value(metadata i8* %0, metadata !114, metadata !DIExpression()) #6, !dbg !1025
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !637, metadata !DIExpression()) #6, !dbg !1021
  %9 = bitcast i8* %3 to i64*, !dbg !1027
  %10 = load i64, i64* %9, align 8, !dbg !1027, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !1028
  call void @llvm.dbg.value(metadata i64 %10, metadata !301, metadata !DIExpression()) #6, !dbg !1030
  %11 = and i64 %10, -16, !dbg !1032
  call void @llvm.dbg.value(metadata i64 %11, metadata !638, metadata !DIExpression()) #6, !dbg !1021
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !123, metadata !DIExpression()) #6, !dbg !1033
  call void @llvm.dbg.value(metadata i64 %11, metadata !128, metadata !DIExpression()) #6, !dbg !1033
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1033
  store i64 %11, i64* %9, align 8, !dbg !1035, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !137, metadata !DIExpression()) #6, !dbg !1036
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !1038
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %11), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1040
  call void @llvm.dbg.value(metadata i64* %31, metadata !130, metadata !DIExpression()) #6, !dbg !1033
  br label %26

12:                                               ; preds = %2
  %13 = tail call i8* @mm_malloc(i64 noundef %1), !dbg !1013
  br i1 %6, label %33, label %14, !dbg !1042

14:                                               ; preds = %12
  call void @llvm.dbg.value(metadata i8* %13, metadata !1012, metadata !DIExpression()), !dbg !1013
  %15 = icmp eq i8* %13, null, !dbg !1043
  br i1 %15, label %33, label %16, !dbg !1045

16:                                               ; preds = %14
  %17 = bitcast i8* %3 to i64*, !dbg !1046
  %18 = load i64, i64* %17, align 8, !dbg !1046, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1047, metadata !DIExpression()), !dbg !1051
  call void @llvm.dbg.value(metadata i64 %18, metadata !1050, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1051
  %19 = add i64 %18, -16, !dbg !1053
  %20 = and i64 %19, -16, !dbg !1053
  call void @llvm.dbg.value(metadata i64 %20, metadata !1011, metadata !DIExpression()), !dbg !1013
  %21 = icmp ugt i64 %20, %1, !dbg !1054
  %22 = select i1 %21, i64 %1, i64 %20, !dbg !1056
  call void @llvm.dbg.value(metadata i64 %22, metadata !1011, metadata !DIExpression()), !dbg !1013
  %23 = tail call i8* @mem_memcpy(i8* noundef nonnull %13, i8* noundef nonnull %0, i64 noundef %22) #6, !dbg !1057
  call void @llvm.dbg.value(metadata i8* %0, metadata !636, metadata !DIExpression()) #6, !dbg !1058
  call void @llvm.dbg.value(metadata i8* %0, metadata !114, metadata !DIExpression()) #6, !dbg !1060
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !637, metadata !DIExpression()) #6, !dbg !1058
  %24 = load i64, i64* %17, align 8, !dbg !1062, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !1063
  call void @llvm.dbg.value(metadata i64 %24, metadata !301, metadata !DIExpression()) #6, !dbg !1065
  %25 = and i64 %24, -16, !dbg !1067
  call void @llvm.dbg.value(metadata i64 %25, metadata !638, metadata !DIExpression()) #6, !dbg !1058
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !123, metadata !DIExpression()) #6, !dbg !1068
  call void @llvm.dbg.value(metadata i64 %25, metadata !128, metadata !DIExpression()) #6, !dbg !1068
  call void @llvm.dbg.value(metadata i1 false, metadata !129, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1068
  store i64 %25, i64* %17, align 8, !dbg !1070, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %4, metadata !137, metadata !DIExpression()) #6, !dbg !1071
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !294, metadata !DIExpression()) #6, !dbg !1073
  call void @llvm.dbg.value(metadata !DIArgList(i64 0, i64 %25), metadata !301, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)) #6, !dbg !1075
  call void @llvm.dbg.value(metadata i64* undef, metadata !130, metadata !DIExpression()) #6, !dbg !1068
  br label %26, !dbg !1077

26:                                               ; preds = %16, %8
  %27 = phi i64 [ %11, %8 ], [ %25, %16 ]
  %28 = phi i8* [ null, %8 ], [ %13, %16 ]
  %29 = getelementptr inbounds i8, i8* %0, i64 %27, !dbg !1013
  %30 = getelementptr inbounds i8, i8* %29, i64 -16, !dbg !1013
  %31 = bitcast i8* %30 to i64*, !dbg !1013
  store i64 %27, i64* %31, align 8, !dbg !1013, !tbaa !96
  %32 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %4) #6, !dbg !1013
  br label %33, !dbg !1078

33:                                               ; preds = %26, %12, %7, %14
  %34 = phi i8* [ null, %14 ], [ null, %7 ], [ %13, %12 ], [ %28, %26 ], !dbg !1013
  ret i8* %34, !dbg !1078
}

declare !dbg !1079 i8* @mem_memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_calloc(i64 noundef %0, i64 noundef %1) local_unnamed_addr #1 !dbg !1084 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1088, metadata !DIExpression()), !dbg !1092
  call void @llvm.dbg.value(metadata i64 %1, metadata !1089, metadata !DIExpression()), !dbg !1092
  %3 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %0, i64 %1), !dbg !1093
  %4 = extractvalue { i64, i1 } %3, 0, !dbg !1093
  call void @llvm.dbg.value(metadata i64 %4, metadata !1091, metadata !DIExpression()), !dbg !1092
  %5 = icmp eq i64 %0, 0, !dbg !1094
  br i1 %5, label %13, label %6, !dbg !1096

6:                                                ; preds = %2
  %7 = extractvalue { i64, i1 } %3, 1, !dbg !1093
  br i1 %7, label %13, label %8, !dbg !1097

8:                                                ; preds = %6
  %9 = tail call i8* @mm_malloc(i64 noundef %4), !dbg !1098
  call void @llvm.dbg.value(metadata i8* %9, metadata !1090, metadata !DIExpression()), !dbg !1092
  %10 = icmp eq i8* %9, null, !dbg !1099
  br i1 %10, label %13, label %11, !dbg !1101

11:                                               ; preds = %8
  %12 = tail call i8* @mem_memset(i8* noundef nonnull %9, i32 noundef 0, i64 noundef %4) #6, !dbg !1102
  br label %13, !dbg !1103

13:                                               ; preds = %8, %6, %2, %11
  %14 = phi i8* [ %9, %11 ], [ null, %2 ], [ null, %6 ], [ null, %8 ], !dbg !1092
  ret i8* %14, !dbg !1104
}

declare !dbg !1105 i8* @mem_memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!59, !60, !61, !62, !63, !64}
!llvm.ident = !{!65}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "seglist", scope: !2, file: !3, line: 151, type: !56, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !37, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "mm.c", directory: "/afs/andrew.cmu.edu/usr3/tianqiyu/private/15513/malloclab-f23-NickYu321", checksumkind: CSK_MD5, checksum: "f24e84e586e9ba79c1a6ba95bafd9063")
!4 = !{!5, !12, !13, !32, !35, !36}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "word_t", file: !3, line: 92, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 45, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!11 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "block_t", file: !3, line: 130, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "block", file: !3, line: 120, size: 192, elements: !16)
!16 = !{!17, !18}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !15, file: !3, line: 122, baseType: !6, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, scope: !15, file: !3, line: 123, baseType: !19, size: 128, offset: 64)
!19 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !15, file: !3, line: 123, size: 128, elements: !20)
!20 = !{!21, !27}
!21 = !DIDerivedType(tag: DW_TAG_member, scope: !19, file: !3, line: 124, baseType: !22, size: 128)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !19, file: !3, line: 124, size: 128, elements: !23)
!23 = !{!24, !26}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "prevB", scope: !22, file: !3, line: 125, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "nextB", scope: !22, file: !3, line: 126, baseType: !25, size: 64, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !19, file: !3, line: 128, baseType: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 0)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !33, line: 87, baseType: !34)
!33 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!34 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!36 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!37 = !{!38, !43, !45, !0, !47, !50, !52, !54}
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!39 = distinct !DIGlobalVariable(name: "wsize", scope: !2, file: !3, line: 95, type: !40, isLocal: true, isDefinition: true)
!40 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !11)
!42 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!44 = distinct !DIGlobalVariable(name: "chunksize", scope: !2, file: !3, line: 111, type: !40, isLocal: true, isDefinition: true)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!46 = distinct !DIGlobalVariable(name: "dsize", scope: !2, file: !3, line: 98, type: !40, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!48 = distinct !DIGlobalVariable(name: "alloc_mask", scope: !2, file: !3, line: 114, type: !49, isLocal: true, isDefinition: true)
!49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "heap_start", scope: !2, file: !3, line: 149, type: !13, isLocal: true, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_stack_value))
!53 = distinct !DIGlobalVariable(name: "size_mask", scope: !2, file: !3, line: 117, type: !49, isLocal: true, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression(DW_OP_constu, 32, DW_OP_stack_value))
!55 = distinct !DIGlobalVariable(name: "min_block_size", scope: !2, file: !3, line: 104, type: !40, isLocal: true, isDefinition: true)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 896, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !{i32 7, !"Dwarf Version", i32 5}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"PIC Level", i32 2}
!63 = !{i32 7, !"PIE Level", i32 2}
!64 = !{i32 7, !"uwtable", i32 1}
!65 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!66 = distinct !DISubprogram(name: "mm_checkheap", scope: !3, file: !3, line: 673, type: !67, scopeLine: 673, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !70)
!67 = !DISubroutineType(types: !68)
!68 = !{!36, !69}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !{!71}
!71 = !DILocalVariable(name: "line", arg: 1, scope: !66, file: !3, line: 673, type: !69)
!72 = !DILocation(line: 0, scope: !66)
!73 = !DILocation(line: 754, column: 6, scope: !66)
!74 = distinct !DISubprogram(name: "mm_init", scope: !3, file: !3, line: 763, type: !75, scopeLine: 763, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !77)
!75 = !DISubroutineType(types: !76)
!76 = !{!36}
!77 = !{!78, !79}
!78 = !DILocalVariable(name: "start", scope: !74, file: !3, line: 765, type: !5)
!79 = !DILocalVariable(name: "i", scope: !80, file: !3, line: 771, type: !69)
!80 = distinct !DILexicalBlock(scope: !74, file: !3, line: 771, column: 5)
!81 = !DILocation(line: 765, column: 32, scope: !74)
!82 = !DILocation(line: 0, scope: !74)
!83 = !DILocation(line: 766, column: 15, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !3, line: 766, column: 9)
!85 = !DILocation(line: 766, column: 9, scope: !74)
!86 = !DILocation(line: 772, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !3, line: 771, column: 37)
!88 = distinct !DILexicalBlock(scope: !80, file: !3, line: 771, column: 5)
!89 = !{!90, !90, i64 0}
!90 = !{!"any pointer", !91, i64 0}
!91 = !{!"omnipotent char", !92, i64 0}
!92 = !{!"Simple C/C++ TBAA"}
!93 = !DILocation(line: 0, scope: !80)
!94 = !DILocation(line: 776, column: 5, scope: !74)
!95 = !DILocation(line: 775, column: 14, scope: !74)
!96 = !{!97, !97, i64 0}
!97 = !{!"long", !91, i64 0}
!98 = !DILocation(line: 779, column: 16, scope: !74)
!99 = !DILocalVariable(name: "size", arg: 1, scope: !100, file: !3, line: 553, type: !41)
!100 = distinct !DISubprogram(name: "extend_heap", scope: !3, file: !3, line: 553, type: !101, scopeLine: 553, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !103)
!101 = !DISubroutineType(types: !102)
!102 = !{!13, !41}
!103 = !{!99, !104, !105, !106}
!104 = !DILocalVariable(name: "bp", scope: !100, file: !3, line: 554, type: !12)
!105 = !DILocalVariable(name: "block", scope: !100, file: !3, line: 570, type: !13)
!106 = !DILocalVariable(name: "block_next", scope: !100, file: !3, line: 574, type: !13)
!107 = !DILocation(line: 0, scope: !100, inlinedAt: !108)
!108 = distinct !DILocation(line: 781, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !74, file: !3, line: 781, column: 9)
!110 = !DILocation(line: 558, column: 15, scope: !111, inlinedAt: !108)
!111 = distinct !DILexicalBlock(scope: !100, file: !3, line: 558, column: 9)
!112 = !DILocation(line: 558, column: 41, scope: !111, inlinedAt: !108)
!113 = !DILocation(line: 558, column: 9, scope: !100, inlinedAt: !108)
!114 = !DILocalVariable(name: "bp", arg: 1, scope: !115, file: !3, line: 241, type: !12)
!115 = distinct !DISubprogram(name: "payload_to_header", scope: !3, file: !3, line: 241, type: !116, scopeLine: 241, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !118)
!116 = !DISubroutineType(types: !117)
!117 = !{!13, !12}
!118 = !{!114}
!119 = !DILocation(line: 0, scope: !115, inlinedAt: !120)
!120 = distinct !DILocation(line: 570, column: 22, scope: !100, inlinedAt: !108)
!121 = !DILocation(line: 242, column: 35, scope: !115, inlinedAt: !120)
!122 = !DILocation(line: 242, column: 12, scope: !115, inlinedAt: !120)
!123 = !DILocalVariable(name: "block", arg: 1, scope: !124, file: !3, line: 350, type: !13)
!124 = distinct !DISubprogram(name: "write_block", scope: !3, file: !3, line: 350, type: !125, scopeLine: 350, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !127)
!125 = !DISubroutineType(types: !126)
!126 = !{null, !13, !41, !36}
!127 = !{!123, !128, !129, !130}
!128 = !DILocalVariable(name: "size", arg: 2, scope: !124, file: !3, line: 350, type: !41)
!129 = !DILocalVariable(name: "alloc", arg: 3, scope: !124, file: !3, line: 350, type: !36)
!130 = !DILocalVariable(name: "footerp", scope: !124, file: !3, line: 354, type: !5)
!131 = !DILocation(line: 0, scope: !124, inlinedAt: !132)
!132 = distinct !DILocation(line: 571, column: 5, scope: !100, inlinedAt: !108)
!133 = !DILocation(line: 353, column: 12, scope: !124, inlinedAt: !132)
!134 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !132)
!135 = !{!136, !97, i64 0}
!136 = !{!"block", !97, i64 0, !91, i64 8}
!137 = !DILocalVariable(name: "block", arg: 1, scope: !138, file: !3, line: 264, type: !13)
!138 = distinct !DISubprogram(name: "header_to_footer", scope: !3, file: !3, line: 264, type: !139, scopeLine: 264, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !141)
!139 = !DISubroutineType(types: !140)
!140 = !{!5, !13}
!141 = !{!137}
!142 = !DILocation(line: 0, scope: !138, inlinedAt: !143)
!143 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !132)
!144 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !143)
!145 = !DILocalVariable(name: "block", arg: 1, scope: !146, file: !3, line: 369, type: !13)
!146 = distinct !DISubprogram(name: "find_next", scope: !3, file: !3, line: 369, type: !147, scopeLine: 369, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !149)
!147 = !DISubroutineType(types: !148)
!148 = !{!13, !13}
!149 = !{!145}
!150 = !DILocation(line: 0, scope: !146, inlinedAt: !151)
!151 = distinct !DILocation(line: 574, column: 27, scope: !100, inlinedAt: !108)
!152 = !DILocalVariable(name: "block", arg: 1, scope: !153, file: !3, line: 332, type: !13)
!153 = distinct !DISubprogram(name: "write_epilogue", scope: !3, file: !3, line: 332, type: !154, scopeLine: 332, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !156)
!154 = !DISubroutineType(types: !155)
!155 = !{null, !13}
!156 = !{!152}
!157 = !DILocation(line: 0, scope: !153, inlinedAt: !158)
!158 = distinct !DILocation(line: 575, column: 5, scope: !100, inlinedAt: !108)
!159 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !132)
!160 = !DILocation(line: 578, column: 13, scope: !100, inlinedAt: !108)
!161 = !DILocation(line: 785, column: 1, scope: !74)
!162 = !DISubprogram(name: "mem_sbrk", scope: !163, file: !163, line: 37, type: !164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !166)
!163 = !DIFile(filename: "./memlib.h", directory: "/afs/andrew.cmu.edu/usr3/tianqiyu/private/15513/malloclab-f23-NickYu321", checksumkind: CSK_MD5, checksum: "37b081d8653fabdc7bb50cf8ca5e2d25")
!164 = !DISubroutineType(types: !165)
!165 = !{!12, !32}
!166 = !{}
!167 = distinct !DISubprogram(name: "mm_malloc", scope: !3, file: !3, line: 797, type: !168, scopeLine: 797, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !170)
!168 = !DISubroutineType(types: !169)
!169 = !{!12, !41}
!170 = !{!171, !172, !173, !174, !175, !176}
!171 = !DILocalVariable(name: "size", arg: 1, scope: !167, file: !3, line: 797, type: !41)
!172 = !DILocalVariable(name: "asize", scope: !167, file: !3, line: 800, type: !41)
!173 = !DILocalVariable(name: "extendsize", scope: !167, file: !3, line: 801, type: !41)
!174 = !DILocalVariable(name: "block", scope: !167, file: !3, line: 802, type: !13)
!175 = !DILocalVariable(name: "bp", scope: !167, file: !3, line: 803, type: !12)
!176 = !DILocalVariable(name: "block_size", scope: !167, file: !3, line: 840, type: !41)
!177 = !DILocation(line: 0, scope: !167)
!178 = !DILocation(line: 806, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !167, file: !3, line: 806, column: 9)
!180 = !DILocation(line: 806, column: 20, scope: !179)
!181 = !DILocation(line: 806, column: 9, scope: !167)
!182 = !DILocation(line: 765, column: 32, scope: !74, inlinedAt: !183)
!183 = distinct !DILocation(line: 807, column: 15, scope: !184)
!184 = distinct !DILexicalBlock(scope: !185, file: !3, line: 807, column: 13)
!185 = distinct !DILexicalBlock(scope: !179, file: !3, line: 806, column: 29)
!186 = !DILocation(line: 0, scope: !74, inlinedAt: !183)
!187 = !DILocation(line: 766, column: 15, scope: !84, inlinedAt: !183)
!188 = !DILocation(line: 766, column: 9, scope: !74, inlinedAt: !183)
!189 = !DILocation(line: 772, column: 20, scope: !87, inlinedAt: !183)
!190 = !DILocation(line: 0, scope: !80, inlinedAt: !183)
!191 = !DILocation(line: 776, column: 5, scope: !74, inlinedAt: !183)
!192 = !DILocation(line: 775, column: 14, scope: !74, inlinedAt: !183)
!193 = !DILocation(line: 779, column: 16, scope: !74, inlinedAt: !183)
!194 = !DILocation(line: 0, scope: !100, inlinedAt: !195)
!195 = distinct !DILocation(line: 781, column: 9, scope: !109, inlinedAt: !183)
!196 = !DILocation(line: 558, column: 15, scope: !111, inlinedAt: !195)
!197 = !DILocation(line: 558, column: 41, scope: !111, inlinedAt: !195)
!198 = !DILocation(line: 558, column: 9, scope: !100, inlinedAt: !195)
!199 = !DILocation(line: 0, scope: !115, inlinedAt: !200)
!200 = distinct !DILocation(line: 570, column: 22, scope: !100, inlinedAt: !195)
!201 = !DILocation(line: 242, column: 35, scope: !115, inlinedAt: !200)
!202 = !DILocation(line: 242, column: 12, scope: !115, inlinedAt: !200)
!203 = !DILocation(line: 0, scope: !124, inlinedAt: !204)
!204 = distinct !DILocation(line: 571, column: 5, scope: !100, inlinedAt: !195)
!205 = !DILocation(line: 353, column: 12, scope: !124, inlinedAt: !204)
!206 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !204)
!207 = !DILocation(line: 0, scope: !138, inlinedAt: !208)
!208 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !204)
!209 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !208)
!210 = !DILocation(line: 0, scope: !146, inlinedAt: !211)
!211 = distinct !DILocation(line: 574, column: 27, scope: !100, inlinedAt: !195)
!212 = !DILocation(line: 0, scope: !153, inlinedAt: !213)
!213 = distinct !DILocation(line: 575, column: 5, scope: !100, inlinedAt: !195)
!214 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !204)
!215 = !DILocation(line: 578, column: 13, scope: !100, inlinedAt: !195)
!216 = !DILocation(line: 807, column: 13, scope: !185)
!217 = !DILocation(line: 814, column: 14, scope: !218)
!218 = distinct !DILexicalBlock(scope: !167, file: !3, line: 814, column: 9)
!219 = !DILocation(line: 814, column: 9, scope: !167)
!220 = !DILocalVariable(name: "size", arg: 1, scope: !221, file: !3, line: 189, type: !41)
!221 = distinct !DISubprogram(name: "round_up", scope: !3, file: !3, line: 189, type: !222, scopeLine: 189, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !224)
!222 = !DISubroutineType(types: !223)
!223 = !{!41, !41, !41}
!224 = !{!220, !225}
!225 = !DILocalVariable(name: "n", arg: 2, scope: !221, file: !3, line: 189, type: !41)
!226 = !DILocation(line: 0, scope: !221, inlinedAt: !227)
!227 = distinct !DILocation(line: 820, column: 13, scope: !167)
!228 = !DILocation(line: 190, column: 23, scope: !221, inlinedAt: !227)
!229 = !DILocation(line: 190, column: 14, scope: !221, inlinedAt: !227)
!230 = !DILocalVariable(name: "asize", arg: 1, scope: !231, file: !3, line: 650, type: !41)
!231 = distinct !DISubprogram(name: "find_fit", scope: !3, file: !3, line: 650, type: !101, scopeLine: 650, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !232)
!232 = !{!230, !233, !234}
!233 = !DILocalVariable(name: "block", scope: !231, file: !3, line: 651, type: !13)
!234 = !DILocalVariable(name: "i", scope: !235, file: !3, line: 653, type: !41)
!235 = distinct !DILexicalBlock(scope: !231, file: !3, line: 653, column: 5)
!236 = !DILocation(line: 0, scope: !231, inlinedAt: !237)
!237 = distinct !DILocation(line: 823, column: 13, scope: !167)
!238 = !DILocalVariable(name: "size", arg: 1, scope: !239, file: !3, line: 412, type: !41)
!239 = distinct !DISubprogram(name: "search_seglist", scope: !3, file: !3, line: 412, type: !240, scopeLine: 412, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !242)
!240 = !DISubroutineType(types: !241)
!241 = !{!41, !41}
!242 = !{!238}
!243 = !DILocation(line: 0, scope: !239, inlinedAt: !244)
!244 = distinct !DILocation(line: 653, column: 21, scope: !235, inlinedAt: !237)
!245 = !DILocation(line: 413, column: 13, scope: !246, inlinedAt: !244)
!246 = distinct !DILexicalBlock(scope: !239, file: !3, line: 413, column: 8)
!247 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !244)
!248 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !244)
!249 = distinct !DILexicalBlock(scope: !246, file: !3, line: 414, column: 13)
!250 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !244)
!251 = distinct !DILexicalBlock(scope: !249, file: !3, line: 415, column: 13)
!252 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !244)
!253 = distinct !DILexicalBlock(scope: !251, file: !3, line: 416, column: 13)
!254 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !244)
!255 = distinct !DILexicalBlock(scope: !253, file: !3, line: 417, column: 13)
!256 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !244)
!257 = distinct !DILexicalBlock(scope: !255, file: !3, line: 418, column: 13)
!258 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !244)
!259 = distinct !DILexicalBlock(scope: !257, file: !3, line: 419, column: 13)
!260 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !244)
!261 = distinct !DILexicalBlock(scope: !259, file: !3, line: 420, column: 13)
!262 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !244)
!263 = distinct !DILexicalBlock(scope: !261, file: !3, line: 421, column: 13)
!264 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !244)
!265 = distinct !DILexicalBlock(scope: !263, file: !3, line: 422, column: 13)
!266 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !244)
!267 = distinct !DILexicalBlock(scope: !265, file: !3, line: 423, column: 13)
!268 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !244)
!269 = distinct !DILexicalBlock(scope: !267, file: !3, line: 424, column: 13)
!270 = !DILocation(line: 0, scope: !271, inlinedAt: !244)
!271 = distinct !DILexicalBlock(scope: !269, file: !3, line: 425, column: 13)
!272 = !DILocation(line: 653, column: 5, scope: !235, inlinedAt: !237)
!273 = !DILocation(line: 0, scope: !235, inlinedAt: !237)
!274 = !DILocation(line: 654, column: 32, scope: !275, inlinedAt: !237)
!275 = distinct !DILexicalBlock(scope: !276, file: !3, line: 653, column: 63)
!276 = distinct !DILexicalBlock(scope: !235, file: !3, line: 653, column: 5)
!277 = !DILocalVariable(name: "block", arg: 1, scope: !278, file: !3, line: 615, type: !13)
!278 = distinct !DISubprogram(name: "search_bestfit", scope: !3, file: !3, line: 615, type: !279, scopeLine: 615, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !281)
!279 = !DISubroutineType(types: !280)
!280 = !{!13, !13, !41}
!281 = !{!277, !282, !283, !284, !285, !286, !287}
!282 = !DILocalVariable(name: "asize", arg: 2, scope: !278, file: !3, line: 615, type: !41)
!283 = !DILocalVariable(name: "seg", scope: !278, file: !3, line: 617, type: !13)
!284 = !DILocalVariable(name: "best", scope: !278, file: !3, line: 618, type: !13)
!285 = !DILocalVariable(name: "best_size", scope: !278, file: !3, line: 619, type: !41)
!286 = !DILocalVariable(name: "curr_size", scope: !278, file: !3, line: 620, type: !41)
!287 = !DILocalVariable(name: "found_count", scope: !278, file: !3, line: 621, type: !69)
!288 = !DILocation(line: 0, scope: !278, inlinedAt: !289)
!289 = distinct !DILocation(line: 654, column: 17, scope: !275, inlinedAt: !237)
!290 = !DILocation(line: 622, column: 15, scope: !278, inlinedAt: !289)
!291 = !DILocation(line: 622, column: 5, scope: !278, inlinedAt: !289)
!292 = !DILocation(line: 623, column: 21, scope: !293, inlinedAt: !289)
!293 = distinct !DILexicalBlock(scope: !278, file: !3, line: 622, column: 23)
!294 = !DILocalVariable(name: "block", arg: 1, scope: !295, file: !3, line: 231, type: !13)
!295 = distinct !DISubprogram(name: "get_size", scope: !3, file: !3, line: 231, type: !296, scopeLine: 231, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !298)
!296 = !DISubroutineType(types: !297)
!297 = !{!41, !13}
!298 = !{!294}
!299 = !DILocation(line: 0, scope: !295, inlinedAt: !300)
!300 = distinct !DILocation(line: 623, column: 21, scope: !293, inlinedAt: !289)
!301 = !DILocalVariable(name: "word", arg: 1, scope: !302, file: !3, line: 222, type: !6)
!302 = distinct !DISubprogram(name: "extract_size", scope: !3, file: !3, line: 222, type: !303, scopeLine: 222, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !305)
!303 = !DISubroutineType(types: !304)
!304 = !{!41, !6}
!305 = !{!301}
!306 = !DILocation(line: 0, scope: !302, inlinedAt: !307)
!307 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !300)
!308 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !307)
!309 = !DILocation(line: 625, column: 23, scope: !310, inlinedAt: !289)
!310 = distinct !DILexicalBlock(scope: !293, file: !3, line: 625, column: 13)
!311 = !DILocation(line: 625, column: 13, scope: !293, inlinedAt: !289)
!312 = !DILocation(line: 629, column: 28, scope: !313, inlinedAt: !289)
!313 = distinct !DILexicalBlock(scope: !310, file: !3, line: 629, column: 17)
!314 = !DILocation(line: 629, column: 37, scope: !313, inlinedAt: !289)
!315 = !DILocation(line: 634, column: 20, scope: !293, inlinedAt: !289)
!316 = !{!91, !91, i64 0}
!317 = !DILocation(line: 655, column: 19, scope: !318, inlinedAt: !237)
!318 = distinct !DILexicalBlock(scope: !275, file: !3, line: 655, column: 13)
!319 = !DILocation(line: 655, column: 13, scope: !275, inlinedAt: !237)
!320 = !DILocation(line: 653, column: 58, scope: !276, inlinedAt: !237)
!321 = !DILocation(line: 653, column: 46, scope: !276, inlinedAt: !237)
!322 = distinct !{!322, !272, !323, !324}
!323 = !DILocation(line: 658, column: 5, scope: !235, inlinedAt: !237)
!324 = !{!"llvm.loop.mustprogress"}
!325 = !DILocalVariable(name: "x", arg: 1, scope: !326, file: !3, line: 179, type: !41)
!326 = distinct !DISubprogram(name: "max", scope: !3, file: !3, line: 179, type: !222, scopeLine: 179, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !327)
!327 = !{!325, !328}
!328 = !DILocalVariable(name: "y", arg: 2, scope: !326, file: !3, line: 179, type: !41)
!329 = !DILocation(line: 0, scope: !326, inlinedAt: !330)
!330 = distinct !DILocation(line: 828, column: 22, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !3, line: 826, column: 24)
!332 = distinct !DILexicalBlock(scope: !167, file: !3, line: 826, column: 9)
!333 = !DILocation(line: 180, column: 15, scope: !326, inlinedAt: !330)
!334 = !DILocation(line: 180, column: 12, scope: !326, inlinedAt: !330)
!335 = !DILocation(line: 0, scope: !100, inlinedAt: !336)
!336 = distinct !DILocation(line: 829, column: 17, scope: !331)
!337 = !DILocation(line: 0, scope: !221, inlinedAt: !338)
!338 = distinct !DILocation(line: 557, column: 12, scope: !100, inlinedAt: !336)
!339 = !DILocation(line: 558, column: 15, scope: !111, inlinedAt: !336)
!340 = !DILocation(line: 558, column: 41, scope: !111, inlinedAt: !336)
!341 = !DILocation(line: 558, column: 9, scope: !100, inlinedAt: !336)
!342 = !DILocation(line: 0, scope: !115, inlinedAt: !343)
!343 = distinct !DILocation(line: 570, column: 22, scope: !100, inlinedAt: !336)
!344 = !DILocation(line: 242, column: 35, scope: !115, inlinedAt: !343)
!345 = !DILocation(line: 242, column: 12, scope: !115, inlinedAt: !343)
!346 = !DILocation(line: 0, scope: !124, inlinedAt: !347)
!347 = distinct !DILocation(line: 571, column: 5, scope: !100, inlinedAt: !336)
!348 = !DILocation(line: 353, column: 12, scope: !124, inlinedAt: !347)
!349 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !347)
!350 = !DILocation(line: 0, scope: !138, inlinedAt: !351)
!351 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !347)
!352 = !DILocation(line: 0, scope: !295, inlinedAt: !353)
!353 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !351)
!354 = !DILocation(line: 0, scope: !302, inlinedAt: !355)
!355 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !353)
!356 = !DILocation(line: 267, column: 38, scope: !138, inlinedAt: !351)
!357 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !351)
!358 = !DILocation(line: 267, column: 12, scope: !138, inlinedAt: !351)
!359 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !347)
!360 = !DILocation(line: 0, scope: !146, inlinedAt: !361)
!361 = distinct !DILocation(line: 574, column: 27, scope: !100, inlinedAt: !336)
!362 = !DILocation(line: 373, column: 40, scope: !146, inlinedAt: !361)
!363 = !DILocation(line: 0, scope: !295, inlinedAt: !364)
!364 = distinct !DILocation(line: 373, column: 40, scope: !146, inlinedAt: !361)
!365 = !DILocation(line: 0, scope: !302, inlinedAt: !366)
!366 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !364)
!367 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !366)
!368 = !DILocation(line: 373, column: 38, scope: !146, inlinedAt: !361)
!369 = !DILocation(line: 0, scope: !153, inlinedAt: !370)
!370 = distinct !DILocation(line: 575, column: 5, scope: !100, inlinedAt: !336)
!371 = !DILocation(line: 335, column: 12, scope: !153, inlinedAt: !370)
!372 = !DILocation(line: 335, column: 19, scope: !153, inlinedAt: !370)
!373 = !DILocation(line: 578, column: 13, scope: !100, inlinedAt: !336)
!374 = !DILocation(line: 831, column: 19, scope: !375)
!375 = distinct !DILexicalBlock(scope: !331, file: !3, line: 831, column: 13)
!376 = !DILocation(line: 831, column: 13, scope: !331)
!377 = !DILocation(line: 840, column: 25, scope: !167)
!378 = !DILocation(line: 0, scope: !295, inlinedAt: !379)
!379 = distinct !DILocation(line: 840, column: 25, scope: !167)
!380 = !DILocation(line: 0, scope: !302, inlinedAt: !381)
!381 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !379)
!382 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !381)
!383 = !DILocation(line: 0, scope: !124, inlinedAt: !384)
!384 = distinct !DILocation(line: 841, column: 5, scope: !167)
!385 = !DILocalVariable(name: "size", arg: 1, scope: !386, file: !3, line: 205, type: !41)
!386 = distinct !DISubprogram(name: "pack", scope: !3, file: !3, line: 205, type: !387, scopeLine: 205, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !389)
!387 = !DISubroutineType(types: !388)
!388 = !{!6, !41, !36}
!389 = !{!385, !390, !391}
!390 = !DILocalVariable(name: "alloc", arg: 2, scope: !386, file: !3, line: 205, type: !36)
!391 = !DILocalVariable(name: "word", scope: !386, file: !3, line: 206, type: !6)
!392 = !DILocation(line: 0, scope: !386, inlinedAt: !393)
!393 = distinct !DILocation(line: 353, column: 21, scope: !124, inlinedAt: !384)
!394 = !DILocation(line: 207, column: 9, scope: !386, inlinedAt: !393)
!395 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !384)
!396 = !DILocation(line: 0, scope: !138, inlinedAt: !397)
!397 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !384)
!398 = !DILocation(line: 267, column: 30, scope: !138, inlinedAt: !397)
!399 = !DILocation(line: 267, column: 23, scope: !138, inlinedAt: !397)
!400 = !DILocation(line: 0, scope: !295, inlinedAt: !401)
!401 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !397)
!402 = !DILocation(line: 0, scope: !302, inlinedAt: !403)
!403 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !401)
!404 = !DILocation(line: 267, column: 38, scope: !138, inlinedAt: !397)
!405 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !397)
!406 = !DILocation(line: 267, column: 12, scope: !138, inlinedAt: !397)
!407 = !DILocation(line: 0, scope: !386, inlinedAt: !408)
!408 = distinct !DILocation(line: 355, column: 16, scope: !124, inlinedAt: !384)
!409 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !384)
!410 = !DILocalVariable(name: "block", arg: 1, scope: !411, file: !3, line: 590, type: !13)
!411 = distinct !DISubprogram(name: "split_block", scope: !3, file: !3, line: 590, type: !412, scopeLine: 590, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !414)
!412 = !DISubroutineType(types: !413)
!413 = !{null, !13, !41}
!414 = !{!410, !415, !416, !417}
!415 = !DILocalVariable(name: "asize", arg: 2, scope: !411, file: !3, line: 590, type: !41)
!416 = !DILocalVariable(name: "block_size", scope: !411, file: !3, line: 592, type: !41)
!417 = !DILocalVariable(name: "block_next", scope: !418, file: !3, line: 595, type: !13)
!418 = distinct !DILexicalBlock(scope: !419, file: !3, line: 594, column: 49)
!419 = distinct !DILexicalBlock(scope: !411, file: !3, line: 594, column: 9)
!420 = !DILocation(line: 0, scope: !411, inlinedAt: !421)
!421 = distinct !DILocation(line: 844, column: 5, scope: !167)
!422 = !DILocation(line: 592, column: 25, scope: !411, inlinedAt: !421)
!423 = !DILocation(line: 0, scope: !295, inlinedAt: !424)
!424 = distinct !DILocation(line: 592, column: 25, scope: !411, inlinedAt: !421)
!425 = !DILocation(line: 0, scope: !302, inlinedAt: !426)
!426 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !424)
!427 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !426)
!428 = !DILocation(line: 594, column: 21, scope: !419, inlinedAt: !421)
!429 = !DILocation(line: 594, column: 30, scope: !419, inlinedAt: !421)
!430 = !DILocalVariable(name: "block", arg: 1, scope: !431, file: !3, line: 463, type: !13)
!431 = distinct !DISubprogram(name: "remove_seglist", scope: !3, file: !3, line: 463, type: !412, scopeLine: 463, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !432)
!432 = !{!430, !433, !434, !435, !436}
!433 = !DILocalVariable(name: "size", arg: 2, scope: !431, file: !3, line: 463, type: !41)
!434 = !DILocalVariable(name: "index", scope: !431, file: !3, line: 464, type: !41)
!435 = !DILocalVariable(name: "prev_block", scope: !431, file: !3, line: 465, type: !13)
!436 = !DILocalVariable(name: "next_block", scope: !431, file: !3, line: 466, type: !13)
!437 = !DILocation(line: 0, scope: !431, inlinedAt: !438)
!438 = distinct !DILocation(line: 596, column: 9, scope: !418, inlinedAt: !421)
!439 = !DILocation(line: 0, scope: !431, inlinedAt: !440)
!440 = distinct !DILocation(line: 603, column: 9, scope: !441, inlinedAt: !421)
!441 = distinct !DILexicalBlock(scope: !419, file: !3, line: 602, column: 10)
!442 = !DILocation(line: 0, scope: !239, inlinedAt: !443)
!443 = distinct !DILocation(line: 464, column: 20, scope: !431, inlinedAt: !438)
!444 = !DILocation(line: 0, scope: !239, inlinedAt: !445)
!445 = distinct !DILocation(line: 464, column: 20, scope: !431, inlinedAt: !440)
!446 = !DILocation(line: 0, scope: !419, inlinedAt: !421)
!447 = !DILocation(line: 594, column: 9, scope: !411, inlinedAt: !421)
!448 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !443)
!449 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !443)
!450 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !443)
!451 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !443)
!452 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !443)
!453 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !443)
!454 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !443)
!455 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !443)
!456 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !443)
!457 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !443)
!458 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !443)
!459 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !443)
!460 = !DILocation(line: 0, scope: !271, inlinedAt: !443)
!461 = !DILocation(line: 0, scope: !246, inlinedAt: !443)
!462 = !DILocation(line: 465, column: 34, scope: !431, inlinedAt: !438)
!463 = !DILocation(line: 466, column: 34, scope: !431, inlinedAt: !438)
!464 = !DILocation(line: 468, column: 19, scope: !465, inlinedAt: !438)
!465 = distinct !DILexicalBlock(scope: !431, file: !3, line: 468, column: 8)
!466 = !DILocation(line: 0, scope: !465, inlinedAt: !438)
!467 = !DILocation(line: 468, column: 8, scope: !431, inlinedAt: !438)
!468 = !DILocation(line: 0, scope: !469, inlinedAt: !438)
!469 = distinct !DILexicalBlock(scope: !470, file: !3, line: 470, column: 12)
!470 = distinct !DILexicalBlock(scope: !465, file: !3, line: 468, column: 27)
!471 = !DILocation(line: 470, column: 12, scope: !470, inlinedAt: !438)
!472 = !DILocation(line: 471, column: 28, scope: !473, inlinedAt: !438)
!473 = distinct !DILexicalBlock(scope: !469, file: !3, line: 470, column: 31)
!474 = !DILocation(line: 472, column: 9, scope: !473, inlinedAt: !438)
!475 = !DILocation(line: 473, column: 28, scope: !476, inlinedAt: !438)
!476 = distinct !DILexicalBlock(scope: !469, file: !3, line: 472, column: 14)
!477 = !DILocation(line: 474, column: 25, scope: !476, inlinedAt: !438)
!478 = !DILocation(line: 474, column: 31, scope: !476, inlinedAt: !438)
!479 = !DILocation(line: 478, column: 13, scope: !465, inlinedAt: !438)
!480 = !DILocation(line: 479, column: 21, scope: !481, inlinedAt: !438)
!481 = distinct !DILexicalBlock(scope: !482, file: !3, line: 478, column: 32)
!482 = distinct !DILexicalBlock(scope: !465, file: !3, line: 478, column: 13)
!483 = !DILocation(line: 479, column: 27, scope: !481, inlinedAt: !438)
!484 = !DILocation(line: 480, column: 5, scope: !481, inlinedAt: !438)
!485 = !DILocation(line: 483, column: 21, scope: !486, inlinedAt: !438)
!486 = distinct !DILexicalBlock(scope: !482, file: !3, line: 482, column: 9)
!487 = !DILocation(line: 483, column: 27, scope: !486, inlinedAt: !438)
!488 = !DILocation(line: 484, column: 21, scope: !486, inlinedAt: !438)
!489 = !DILocation(line: 484, column: 27, scope: !486, inlinedAt: !438)
!490 = !DILocation(line: 488, column: 1, scope: !431, inlinedAt: !438)
!491 = !DILocation(line: 487, column: 18, scope: !431, inlinedAt: !438)
!492 = !DILocation(line: 0, scope: !124, inlinedAt: !493)
!493 = distinct !DILocation(line: 597, column: 9, scope: !418, inlinedAt: !421)
!494 = !DILocation(line: 0, scope: !386, inlinedAt: !495)
!495 = distinct !DILocation(line: 353, column: 21, scope: !124, inlinedAt: !493)
!496 = !DILocation(line: 207, column: 9, scope: !386, inlinedAt: !495)
!497 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !493)
!498 = !DILocation(line: 0, scope: !138, inlinedAt: !499)
!499 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !493)
!500 = !DILocation(line: 0, scope: !295, inlinedAt: !501)
!501 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !499)
!502 = !DILocation(line: 0, scope: !302, inlinedAt: !503)
!503 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !501)
!504 = !DILocation(line: 267, column: 38, scope: !138, inlinedAt: !499)
!505 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !499)
!506 = !DILocation(line: 267, column: 12, scope: !138, inlinedAt: !499)
!507 = !DILocation(line: 0, scope: !386, inlinedAt: !508)
!508 = distinct !DILocation(line: 355, column: 16, scope: !124, inlinedAt: !493)
!509 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !493)
!510 = !DILocation(line: 0, scope: !146, inlinedAt: !511)
!511 = distinct !DILocation(line: 599, column: 22, scope: !418, inlinedAt: !421)
!512 = !DILocation(line: 373, column: 24, scope: !146, inlinedAt: !511)
!513 = !DILocation(line: 373, column: 40, scope: !146, inlinedAt: !511)
!514 = !DILocation(line: 0, scope: !295, inlinedAt: !515)
!515 = distinct !DILocation(line: 373, column: 40, scope: !146, inlinedAt: !511)
!516 = !DILocation(line: 0, scope: !302, inlinedAt: !517)
!517 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !515)
!518 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !517)
!519 = !DILocation(line: 373, column: 38, scope: !146, inlinedAt: !511)
!520 = !DILocation(line: 0, scope: !418, inlinedAt: !421)
!521 = !DILocation(line: 0, scope: !124, inlinedAt: !522)
!522 = distinct !DILocation(line: 600, column: 9, scope: !418, inlinedAt: !421)
!523 = !DILocation(line: 0, scope: !386, inlinedAt: !524)
!524 = distinct !DILocation(line: 353, column: 21, scope: !124, inlinedAt: !522)
!525 = !DILocation(line: 353, column: 12, scope: !124, inlinedAt: !522)
!526 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !522)
!527 = !DILocation(line: 0, scope: !138, inlinedAt: !528)
!528 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !522)
!529 = !DILocation(line: 267, column: 30, scope: !138, inlinedAt: !528)
!530 = !DILocation(line: 0, scope: !295, inlinedAt: !531)
!531 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !528)
!532 = !DILocation(line: 0, scope: !302, inlinedAt: !533)
!533 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !531)
!534 = !DILocation(line: 267, column: 38, scope: !138, inlinedAt: !528)
!535 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !528)
!536 = !DILocation(line: 267, column: 12, scope: !138, inlinedAt: !528)
!537 = !DILocation(line: 0, scope: !386, inlinedAt: !538)
!538 = distinct !DILocation(line: 355, column: 16, scope: !124, inlinedAt: !522)
!539 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !522)
!540 = !DILocalVariable(name: "block", arg: 1, scope: !541, file: !3, line: 438, type: !13)
!541 = distinct !DISubprogram(name: "insert_seglist", scope: !3, file: !3, line: 438, type: !412, scopeLine: 438, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !542)
!542 = !{!540, !543, !544}
!543 = !DILocalVariable(name: "size", arg: 2, scope: !541, file: !3, line: 438, type: !41)
!544 = !DILocalVariable(name: "index", scope: !541, file: !3, line: 439, type: !41)
!545 = !DILocation(line: 0, scope: !541, inlinedAt: !546)
!546 = distinct !DILocation(line: 601, column: 9, scope: !418, inlinedAt: !421)
!547 = !DILocation(line: 0, scope: !239, inlinedAt: !548)
!548 = distinct !DILocation(line: 439, column: 20, scope: !541, inlinedAt: !546)
!549 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !548)
!550 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !548)
!551 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !548)
!552 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !548)
!553 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !548)
!554 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !548)
!555 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !548)
!556 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !548)
!557 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !548)
!558 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !548)
!559 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !548)
!560 = !DILocation(line: 0, scope: !271, inlinedAt: !548)
!561 = !DILocation(line: 0, scope: !246, inlinedAt: !548)
!562 = !DILocation(line: 441, column: 8, scope: !563, inlinedAt: !546)
!563 = distinct !DILexicalBlock(scope: !541, file: !3, line: 441, column: 8)
!564 = !DILocation(line: 441, column: 23, scope: !563, inlinedAt: !546)
!565 = !DILocation(line: 441, column: 8, scope: !541, inlinedAt: !546)
!566 = !DILocation(line: 443, column: 22, scope: !567, inlinedAt: !546)
!567 = distinct !DILexicalBlock(scope: !563, file: !3, line: 441, column: 31)
!568 = !DILocation(line: 446, column: 5, scope: !567, inlinedAt: !546)
!569 = !DILocation(line: 0, scope: !563, inlinedAt: !546)
!570 = !DILocation(line: 447, column: 22, scope: !571, inlinedAt: !546)
!571 = distinct !DILexicalBlock(scope: !563, file: !3, line: 446, column: 10)
!572 = !DILocation(line: 448, column: 16, scope: !571, inlinedAt: !546)
!573 = !DILocation(line: 448, column: 22, scope: !571, inlinedAt: !546)
!574 = !DILocation(line: 449, column: 25, scope: !571, inlinedAt: !546)
!575 = !DILocation(line: 449, column: 31, scope: !571, inlinedAt: !546)
!576 = !DILocation(line: 602, column: 5, scope: !418, inlinedAt: !421)
!577 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !445)
!578 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !445)
!579 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !445)
!580 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !445)
!581 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !445)
!582 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !445)
!583 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !445)
!584 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !445)
!585 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !445)
!586 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !445)
!587 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !445)
!588 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !445)
!589 = !DILocation(line: 0, scope: !271, inlinedAt: !445)
!590 = !DILocation(line: 0, scope: !246, inlinedAt: !445)
!591 = !DILocation(line: 465, column: 34, scope: !431, inlinedAt: !440)
!592 = !DILocation(line: 466, column: 34, scope: !431, inlinedAt: !440)
!593 = !DILocation(line: 468, column: 19, scope: !465, inlinedAt: !440)
!594 = !DILocation(line: 0, scope: !465, inlinedAt: !440)
!595 = !DILocation(line: 468, column: 8, scope: !431, inlinedAt: !440)
!596 = !DILocation(line: 0, scope: !469, inlinedAt: !440)
!597 = !DILocation(line: 470, column: 12, scope: !470, inlinedAt: !440)
!598 = !DILocation(line: 471, column: 28, scope: !473, inlinedAt: !440)
!599 = !DILocation(line: 472, column: 9, scope: !473, inlinedAt: !440)
!600 = !DILocation(line: 473, column: 28, scope: !476, inlinedAt: !440)
!601 = !DILocation(line: 474, column: 25, scope: !476, inlinedAt: !440)
!602 = !DILocation(line: 474, column: 31, scope: !476, inlinedAt: !440)
!603 = !DILocation(line: 478, column: 13, scope: !465, inlinedAt: !440)
!604 = !DILocation(line: 479, column: 21, scope: !481, inlinedAt: !440)
!605 = !DILocation(line: 479, column: 27, scope: !481, inlinedAt: !440)
!606 = !DILocation(line: 480, column: 5, scope: !481, inlinedAt: !440)
!607 = !DILocation(line: 483, column: 21, scope: !486, inlinedAt: !440)
!608 = !DILocation(line: 483, column: 27, scope: !486, inlinedAt: !440)
!609 = !DILocation(line: 484, column: 21, scope: !486, inlinedAt: !440)
!610 = !DILocation(line: 484, column: 27, scope: !486, inlinedAt: !440)
!611 = !DILocation(line: 488, column: 1, scope: !431, inlinedAt: !440)
!612 = !DILocation(line: 487, column: 18, scope: !431, inlinedAt: !440)
!613 = !DILocation(line: 0, scope: !124, inlinedAt: !614)
!614 = distinct !DILocation(line: 604, column: 9, scope: !441, inlinedAt: !421)
!615 = !DILocation(line: 0, scope: !386, inlinedAt: !616)
!616 = distinct !DILocation(line: 353, column: 21, scope: !124, inlinedAt: !614)
!617 = !DILocation(line: 207, column: 9, scope: !386, inlinedAt: !616)
!618 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !614)
!619 = !DILocation(line: 0, scope: !138, inlinedAt: !620)
!620 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !614)
!621 = !DILocation(line: 0, scope: !295, inlinedAt: !622)
!622 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !620)
!623 = !DILocation(line: 0, scope: !302, inlinedAt: !624)
!624 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !622)
!625 = !DILocation(line: 267, column: 38, scope: !138, inlinedAt: !620)
!626 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !620)
!627 = !DILocation(line: 267, column: 12, scope: !138, inlinedAt: !620)
!628 = !DILocation(line: 0, scope: !386, inlinedAt: !629)
!629 = distinct !DILocation(line: 355, column: 16, scope: !124, inlinedAt: !614)
!630 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !614)
!631 = !DILocation(line: 850, column: 1, scope: !167)
!632 = distinct !DISubprogram(name: "mm_free", scope: !3, file: !3, line: 860, type: !633, scopeLine: 860, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !635)
!633 = !DISubroutineType(types: !634)
!634 = !{null, !12}
!635 = !{!636, !637, !638}
!636 = !DILocalVariable(name: "bp", arg: 1, scope: !632, file: !3, line: 860, type: !12)
!637 = !DILocalVariable(name: "block", scope: !632, file: !3, line: 866, type: !13)
!638 = !DILocalVariable(name: "size", scope: !632, file: !3, line: 867, type: !41)
!639 = !DILocation(line: 0, scope: !632)
!640 = !DILocation(line: 863, column: 12, scope: !641)
!641 = distinct !DILexicalBlock(scope: !632, file: !3, line: 863, column: 9)
!642 = !DILocation(line: 863, column: 9, scope: !632)
!643 = !DILocation(line: 0, scope: !115, inlinedAt: !644)
!644 = distinct !DILocation(line: 866, column: 22, scope: !632)
!645 = !DILocation(line: 242, column: 35, scope: !115, inlinedAt: !644)
!646 = !DILocation(line: 242, column: 12, scope: !115, inlinedAt: !644)
!647 = !DILocation(line: 867, column: 19, scope: !632)
!648 = !DILocation(line: 0, scope: !295, inlinedAt: !649)
!649 = distinct !DILocation(line: 867, column: 19, scope: !632)
!650 = !DILocation(line: 0, scope: !302, inlinedAt: !651)
!651 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !649)
!652 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !651)
!653 = !DILocation(line: 0, scope: !124, inlinedAt: !654)
!654 = distinct !DILocation(line: 873, column: 5, scope: !632)
!655 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !654)
!656 = !DILocation(line: 0, scope: !138, inlinedAt: !657)
!657 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !654)
!658 = !DILocation(line: 0, scope: !295, inlinedAt: !659)
!659 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !657)
!660 = !DILocation(line: 0, scope: !302, inlinedAt: !661)
!661 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !659)
!662 = !DILocation(line: 267, column: 38, scope: !138, inlinedAt: !657)
!663 = !DILocation(line: 267, column: 56, scope: !138, inlinedAt: !657)
!664 = !DILocation(line: 267, column: 12, scope: !138, inlinedAt: !657)
!665 = !DILocation(line: 355, column: 14, scope: !124, inlinedAt: !654)
!666 = !DILocation(line: 876, column: 5, scope: !632)
!667 = !DILocation(line: 880, column: 1, scope: !632)
!668 = distinct !DISubprogram(name: "coalesce_block", scope: !3, file: !3, line: 509, type: !147, scopeLine: 509, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !669)
!669 = !{!670, !671, !672, !673, !674, !675, !676, !677}
!670 = !DILocalVariable(name: "block", arg: 1, scope: !668, file: !3, line: 509, type: !13)
!671 = !DILocalVariable(name: "next_block", scope: !668, file: !3, line: 511, type: !13)
!672 = !DILocalVariable(name: "prev_block", scope: !668, file: !3, line: 512, type: !13)
!673 = !DILocalVariable(name: "next_sta", scope: !668, file: !3, line: 513, type: !36)
!674 = !DILocalVariable(name: "prev_sta", scope: !668, file: !3, line: 514, type: !36)
!675 = !DILocalVariable(name: "block_size", scope: !668, file: !3, line: 516, type: !41)
!676 = !DILocalVariable(name: "next_block_size", scope: !668, file: !3, line: 517, type: !41)
!677 = !DILocalVariable(name: "prev_block_size", scope: !668, file: !3, line: 518, type: !41)
!678 = !DILocation(line: 0, scope: !668)
!679 = !DILocation(line: 0, scope: !146, inlinedAt: !680)
!680 = distinct !DILocation(line: 511, column: 27, scope: !668)
!681 = !DILocation(line: 373, column: 24, scope: !146, inlinedAt: !680)
!682 = !DILocation(line: 373, column: 40, scope: !146, inlinedAt: !680)
!683 = !DILocation(line: 0, scope: !295, inlinedAt: !684)
!684 = distinct !DILocation(line: 373, column: 40, scope: !146, inlinedAt: !680)
!685 = !DILocation(line: 0, scope: !302, inlinedAt: !686)
!686 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !684)
!687 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !686)
!688 = !DILocation(line: 373, column: 38, scope: !146, inlinedAt: !680)
!689 = !DILocalVariable(name: "block", arg: 1, scope: !690, file: !3, line: 399, type: !13)
!690 = distinct !DISubprogram(name: "find_prev", scope: !3, file: !3, line: 399, type: !147, scopeLine: 399, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !691)
!691 = !{!689, !692}
!692 = !DILocalVariable(name: "footerp", scope: !690, file: !3, line: 403, type: !5)
!693 = !DILocation(line: 0, scope: !690, inlinedAt: !694)
!694 = distinct !DILocation(line: 512, column: 27, scope: !668)
!695 = !DILocalVariable(name: "block", arg: 1, scope: !696, file: !3, line: 381, type: !13)
!696 = distinct !DISubprogram(name: "find_prev_footer", scope: !3, file: !3, line: 381, type: !139, scopeLine: 381, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !697)
!697 = !{!695}
!698 = !DILocation(line: 0, scope: !696, inlinedAt: !699)
!699 = distinct !DILocation(line: 403, column: 23, scope: !690, inlinedAt: !694)
!700 = !DILocation(line: 383, column: 29, scope: !696, inlinedAt: !699)
!701 = !DILocalVariable(name: "footer", arg: 1, scope: !702, file: !3, line: 282, type: !5)
!702 = distinct !DISubprogram(name: "footer_to_header", scope: !3, file: !3, line: 282, type: !703, scopeLine: 282, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !705)
!703 = !DISubroutineType(types: !704)
!704 = !{!13, !5}
!705 = !{!701, !706}
!706 = !DILocalVariable(name: "size", scope: !702, file: !3, line: 283, type: !41)
!707 = !DILocation(line: 0, scope: !702, inlinedAt: !708)
!708 = distinct !DILocation(line: 404, column: 12, scope: !690, inlinedAt: !694)
!709 = !DILocation(line: 283, column: 32, scope: !702, inlinedAt: !708)
!710 = !DILocation(line: 0, scope: !302, inlinedAt: !711)
!711 = distinct !DILocation(line: 283, column: 19, scope: !702, inlinedAt: !708)
!712 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !711)
!713 = !DILocation(line: 284, column: 14, scope: !714, inlinedAt: !708)
!714 = distinct !DILexicalBlock(scope: !702, file: !3, line: 284, column: 9)
!715 = !DILocation(line: 284, column: 9, scope: !702, inlinedAt: !708)
!716 = !DILocation(line: 513, column: 21, scope: !668)
!717 = !DILocalVariable(name: "block", arg: 1, scope: !718, file: !3, line: 321, type: !13)
!718 = distinct !DISubprogram(name: "get_alloc", scope: !3, file: !3, line: 321, type: !719, scopeLine: 321, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !721)
!719 = !DISubroutineType(types: !720)
!720 = !{!36, !13}
!721 = !{!717}
!722 = !DILocation(line: 0, scope: !718, inlinedAt: !723)
!723 = distinct !DILocation(line: 513, column: 21, scope: !668)
!724 = !DILocalVariable(name: "word", arg: 1, scope: !725, file: !3, line: 312, type: !6)
!725 = distinct !DISubprogram(name: "extract_alloc", scope: !3, file: !3, line: 312, type: !726, scopeLine: 312, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !728)
!726 = !DISubroutineType(types: !727)
!727 = !{!36, !6}
!728 = !{!724}
!729 = !DILocation(line: 0, scope: !725, inlinedAt: !730)
!730 = distinct !DILocation(line: 322, column: 12, scope: !718, inlinedAt: !723)
!731 = !DILocation(line: 313, column: 24, scope: !725, inlinedAt: !730)
!732 = !DILocation(line: 313, column: 12, scope: !725, inlinedAt: !730)
!733 = !DILocation(line: 514, column: 21, scope: !668)
!734 = !DILocation(line: 0, scope: !718, inlinedAt: !735)
!735 = distinct !DILocation(line: 514, column: 21, scope: !668)
!736 = !DILocation(line: 0, scope: !725, inlinedAt: !737)
!737 = distinct !DILocation(line: 322, column: 12, scope: !718, inlinedAt: !735)
!738 = !DILocation(line: 313, column: 24, scope: !725, inlinedAt: !737)
!739 = !DILocation(line: 313, column: 12, scope: !725, inlinedAt: !737)
!740 = !DILocation(line: 0, scope: !295, inlinedAt: !741)
!741 = distinct !DILocation(line: 516, column: 25, scope: !668)
!742 = !DILocation(line: 0, scope: !302, inlinedAt: !743)
!743 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !741)
!744 = !DILocation(line: 0, scope: !295, inlinedAt: !745)
!745 = distinct !DILocation(line: 517, column: 30, scope: !668)
!746 = !DILocation(line: 0, scope: !302, inlinedAt: !747)
!747 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !745)
!748 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !747)
!749 = !DILocation(line: 0, scope: !295, inlinedAt: !750)
!750 = distinct !DILocation(line: 518, column: 30, scope: !668)
!751 = !DILocation(line: 0, scope: !302, inlinedAt: !752)
!752 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !750)
!753 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !752)
!754 = !DILocation(line: 520, column: 18, scope: !755)
!755 = distinct !DILexicalBlock(scope: !668, file: !3, line: 520, column: 8)
!756 = !DILocation(line: 0, scope: !124, inlinedAt: !757)
!757 = distinct !DILocation(line: 521, column: 9, scope: !758)
!758 = distinct !DILexicalBlock(scope: !755, file: !3, line: 520, column: 31)
!759 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !757)
!760 = !DILocation(line: 0, scope: !138, inlinedAt: !761)
!761 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !757)
!762 = !DILocation(line: 0, scope: !295, inlinedAt: !763)
!763 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !761)
!764 = !DILocation(line: 0, scope: !302, inlinedAt: !765)
!765 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !763)
!766 = !DILocation(line: 523, column: 5, scope: !758)
!767 = !DILocation(line: 523, column: 23, scope: !768)
!768 = distinct !DILexicalBlock(scope: !755, file: !3, line: 523, column: 14)
!769 = !DILocation(line: 524, column: 20, scope: !770)
!770 = distinct !DILexicalBlock(scope: !768, file: !3, line: 523, column: 36)
!771 = !DILocation(line: 0, scope: !431, inlinedAt: !772)
!772 = distinct !DILocation(line: 525, column: 9, scope: !770)
!773 = !DILocation(line: 0, scope: !239, inlinedAt: !774)
!774 = distinct !DILocation(line: 464, column: 20, scope: !431, inlinedAt: !772)
!775 = !DILocation(line: 413, column: 13, scope: !246, inlinedAt: !774)
!776 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !774)
!777 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !774)
!778 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !774)
!779 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !774)
!780 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !774)
!781 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !774)
!782 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !774)
!783 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !774)
!784 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !774)
!785 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !774)
!786 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !774)
!787 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !774)
!788 = !DILocation(line: 0, scope: !271, inlinedAt: !774)
!789 = !DILocation(line: 0, scope: !246, inlinedAt: !774)
!790 = !DILocation(line: 465, column: 34, scope: !431, inlinedAt: !772)
!791 = !DILocation(line: 466, column: 34, scope: !431, inlinedAt: !772)
!792 = !DILocation(line: 468, column: 19, scope: !465, inlinedAt: !772)
!793 = !DILocation(line: 0, scope: !465, inlinedAt: !772)
!794 = !DILocation(line: 468, column: 8, scope: !431, inlinedAt: !772)
!795 = !DILocation(line: 0, scope: !469, inlinedAt: !772)
!796 = !DILocation(line: 470, column: 12, scope: !470, inlinedAt: !772)
!797 = !DILocation(line: 471, column: 28, scope: !473, inlinedAt: !772)
!798 = !DILocation(line: 472, column: 9, scope: !473, inlinedAt: !772)
!799 = !DILocation(line: 473, column: 28, scope: !476, inlinedAt: !772)
!800 = !DILocation(line: 474, column: 25, scope: !476, inlinedAt: !772)
!801 = !DILocation(line: 474, column: 31, scope: !476, inlinedAt: !772)
!802 = !DILocation(line: 478, column: 13, scope: !465, inlinedAt: !772)
!803 = !DILocation(line: 479, column: 21, scope: !481, inlinedAt: !772)
!804 = !DILocation(line: 479, column: 27, scope: !481, inlinedAt: !772)
!805 = !DILocation(line: 480, column: 5, scope: !481, inlinedAt: !772)
!806 = !DILocation(line: 483, column: 21, scope: !486, inlinedAt: !772)
!807 = !DILocation(line: 483, column: 27, scope: !486, inlinedAt: !772)
!808 = !DILocation(line: 484, column: 21, scope: !486, inlinedAt: !772)
!809 = !DILocation(line: 484, column: 27, scope: !486, inlinedAt: !772)
!810 = !DILocation(line: 487, column: 18, scope: !431, inlinedAt: !772)
!811 = !DILocation(line: 0, scope: !124, inlinedAt: !812)
!812 = distinct !DILocation(line: 526, column: 9, scope: !770)
!813 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !812)
!814 = !DILocation(line: 0, scope: !138, inlinedAt: !815)
!815 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !812)
!816 = !DILocation(line: 0, scope: !295, inlinedAt: !817)
!817 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !815)
!818 = !DILocation(line: 0, scope: !302, inlinedAt: !819)
!819 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !817)
!820 = !DILocation(line: 529, column: 5, scope: !770)
!821 = !DILocation(line: 529, column: 24, scope: !822)
!822 = distinct !DILexicalBlock(scope: !768, file: !3, line: 529, column: 14)
!823 = !DILocation(line: 530, column: 20, scope: !824)
!824 = distinct !DILexicalBlock(scope: !822, file: !3, line: 529, column: 36)
!825 = !DILocation(line: 0, scope: !431, inlinedAt: !826)
!826 = distinct !DILocation(line: 531, column: 9, scope: !824)
!827 = !DILocation(line: 0, scope: !239, inlinedAt: !828)
!828 = distinct !DILocation(line: 464, column: 20, scope: !431, inlinedAt: !826)
!829 = !DILocation(line: 413, column: 13, scope: !246, inlinedAt: !828)
!830 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !828)
!831 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !828)
!832 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !828)
!833 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !828)
!834 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !828)
!835 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !828)
!836 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !828)
!837 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !828)
!838 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !828)
!839 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !828)
!840 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !828)
!841 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !828)
!842 = !DILocation(line: 0, scope: !271, inlinedAt: !828)
!843 = !DILocation(line: 0, scope: !246, inlinedAt: !828)
!844 = !DILocation(line: 465, column: 34, scope: !431, inlinedAt: !826)
!845 = !DILocation(line: 466, column: 34, scope: !431, inlinedAt: !826)
!846 = !DILocation(line: 468, column: 19, scope: !465, inlinedAt: !826)
!847 = !DILocation(line: 0, scope: !465, inlinedAt: !826)
!848 = !DILocation(line: 468, column: 8, scope: !431, inlinedAt: !826)
!849 = !DILocation(line: 0, scope: !469, inlinedAt: !826)
!850 = !DILocation(line: 470, column: 12, scope: !470, inlinedAt: !826)
!851 = !DILocation(line: 471, column: 28, scope: !473, inlinedAt: !826)
!852 = !DILocation(line: 472, column: 9, scope: !473, inlinedAt: !826)
!853 = !DILocation(line: 473, column: 28, scope: !476, inlinedAt: !826)
!854 = !DILocation(line: 474, column: 25, scope: !476, inlinedAt: !826)
!855 = !DILocation(line: 474, column: 31, scope: !476, inlinedAt: !826)
!856 = !DILocation(line: 478, column: 13, scope: !465, inlinedAt: !826)
!857 = !DILocation(line: 479, column: 21, scope: !481, inlinedAt: !826)
!858 = !DILocation(line: 479, column: 27, scope: !481, inlinedAt: !826)
!859 = !DILocation(line: 480, column: 5, scope: !481, inlinedAt: !826)
!860 = !DILocation(line: 483, column: 21, scope: !486, inlinedAt: !826)
!861 = !DILocation(line: 483, column: 27, scope: !486, inlinedAt: !826)
!862 = !DILocation(line: 484, column: 21, scope: !486, inlinedAt: !826)
!863 = !DILocation(line: 484, column: 27, scope: !486, inlinedAt: !826)
!864 = !DILocation(line: 488, column: 1, scope: !431, inlinedAt: !826)
!865 = !DILocation(line: 487, column: 18, scope: !431, inlinedAt: !826)
!866 = !DILocation(line: 0, scope: !124, inlinedAt: !867)
!867 = distinct !DILocation(line: 532, column: 9, scope: !824)
!868 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !867)
!869 = !DILocation(line: 0, scope: !138, inlinedAt: !870)
!870 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !867)
!871 = !DILocation(line: 0, scope: !295, inlinedAt: !872)
!872 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !870)
!873 = !DILocation(line: 0, scope: !302, inlinedAt: !874)
!874 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !872)
!875 = !DILocation(line: 536, column: 5, scope: !824)
!876 = !DILocation(line: 536, column: 24, scope: !877)
!877 = distinct !DILexicalBlock(scope: !822, file: !3, line: 536, column: 14)
!878 = !DILocation(line: 537, column: 33, scope: !879)
!879 = distinct !DILexicalBlock(scope: !877, file: !3, line: 536, column: 37)
!880 = !DILocation(line: 537, column: 50, scope: !879)
!881 = !DILocation(line: 0, scope: !431, inlinedAt: !882)
!882 = distinct !DILocation(line: 538, column: 9, scope: !879)
!883 = !DILocation(line: 0, scope: !239, inlinedAt: !884)
!884 = distinct !DILocation(line: 464, column: 20, scope: !431, inlinedAt: !882)
!885 = !DILocation(line: 413, column: 13, scope: !246, inlinedAt: !884)
!886 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !884)
!887 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !884)
!888 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !884)
!889 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !884)
!890 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !884)
!891 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !884)
!892 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !884)
!893 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !884)
!894 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !884)
!895 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !884)
!896 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !884)
!897 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !884)
!898 = !DILocation(line: 0, scope: !271, inlinedAt: !884)
!899 = !DILocation(line: 0, scope: !246, inlinedAt: !884)
!900 = !DILocation(line: 465, column: 34, scope: !431, inlinedAt: !882)
!901 = !DILocation(line: 466, column: 34, scope: !431, inlinedAt: !882)
!902 = !DILocation(line: 468, column: 19, scope: !465, inlinedAt: !882)
!903 = !DILocation(line: 0, scope: !465, inlinedAt: !882)
!904 = !DILocation(line: 468, column: 8, scope: !431, inlinedAt: !882)
!905 = !DILocation(line: 0, scope: !469, inlinedAt: !882)
!906 = !DILocation(line: 470, column: 12, scope: !470, inlinedAt: !882)
!907 = !DILocation(line: 471, column: 28, scope: !473, inlinedAt: !882)
!908 = !DILocation(line: 472, column: 9, scope: !473, inlinedAt: !882)
!909 = !DILocation(line: 473, column: 28, scope: !476, inlinedAt: !882)
!910 = !DILocation(line: 474, column: 25, scope: !476, inlinedAt: !882)
!911 = !DILocation(line: 474, column: 31, scope: !476, inlinedAt: !882)
!912 = !DILocation(line: 478, column: 13, scope: !465, inlinedAt: !882)
!913 = !DILocation(line: 479, column: 21, scope: !481, inlinedAt: !882)
!914 = !DILocation(line: 479, column: 27, scope: !481, inlinedAt: !882)
!915 = !DILocation(line: 480, column: 5, scope: !481, inlinedAt: !882)
!916 = !DILocation(line: 483, column: 21, scope: !486, inlinedAt: !882)
!917 = !DILocation(line: 483, column: 27, scope: !486, inlinedAt: !882)
!918 = !DILocation(line: 484, column: 21, scope: !486, inlinedAt: !882)
!919 = !DILocation(line: 484, column: 27, scope: !486, inlinedAt: !882)
!920 = !DILocation(line: 488, column: 1, scope: !431, inlinedAt: !882)
!921 = !DILocation(line: 487, column: 18, scope: !431, inlinedAt: !882)
!922 = !DILocation(line: 0, scope: !431, inlinedAt: !923)
!923 = distinct !DILocation(line: 539, column: 9, scope: !879)
!924 = !DILocation(line: 0, scope: !239, inlinedAt: !925)
!925 = distinct !DILocation(line: 464, column: 20, scope: !431, inlinedAt: !923)
!926 = !DILocation(line: 413, column: 13, scope: !246, inlinedAt: !925)
!927 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !925)
!928 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !925)
!929 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !925)
!930 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !925)
!931 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !925)
!932 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !925)
!933 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !925)
!934 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !925)
!935 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !925)
!936 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !925)
!937 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !925)
!938 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !925)
!939 = !DILocation(line: 0, scope: !271, inlinedAt: !925)
!940 = !DILocation(line: 0, scope: !246, inlinedAt: !925)
!941 = !DILocation(line: 465, column: 34, scope: !431, inlinedAt: !923)
!942 = !DILocation(line: 466, column: 34, scope: !431, inlinedAt: !923)
!943 = !DILocation(line: 468, column: 19, scope: !465, inlinedAt: !923)
!944 = !DILocation(line: 0, scope: !465, inlinedAt: !923)
!945 = !DILocation(line: 468, column: 8, scope: !431, inlinedAt: !923)
!946 = !DILocation(line: 0, scope: !469, inlinedAt: !923)
!947 = !DILocation(line: 470, column: 12, scope: !470, inlinedAt: !923)
!948 = !DILocation(line: 471, column: 28, scope: !473, inlinedAt: !923)
!949 = !DILocation(line: 472, column: 9, scope: !473, inlinedAt: !923)
!950 = !DILocation(line: 473, column: 28, scope: !476, inlinedAt: !923)
!951 = !DILocation(line: 474, column: 25, scope: !476, inlinedAt: !923)
!952 = !DILocation(line: 474, column: 31, scope: !476, inlinedAt: !923)
!953 = !DILocation(line: 478, column: 13, scope: !465, inlinedAt: !923)
!954 = !DILocation(line: 479, column: 21, scope: !481, inlinedAt: !923)
!955 = !DILocation(line: 479, column: 27, scope: !481, inlinedAt: !923)
!956 = !DILocation(line: 480, column: 5, scope: !481, inlinedAt: !923)
!957 = !DILocation(line: 483, column: 21, scope: !486, inlinedAt: !923)
!958 = !DILocation(line: 483, column: 27, scope: !486, inlinedAt: !923)
!959 = !DILocation(line: 484, column: 21, scope: !486, inlinedAt: !923)
!960 = !DILocation(line: 484, column: 27, scope: !486, inlinedAt: !923)
!961 = !DILocation(line: 487, column: 18, scope: !431, inlinedAt: !923)
!962 = !DILocation(line: 0, scope: !124, inlinedAt: !963)
!963 = distinct !DILocation(line: 540, column: 9, scope: !879)
!964 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !963)
!965 = !DILocation(line: 0, scope: !138, inlinedAt: !966)
!966 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !963)
!967 = !DILocation(line: 0, scope: !295, inlinedAt: !968)
!968 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !966)
!969 = !DILocation(line: 0, scope: !302, inlinedAt: !970)
!970 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !968)
!971 = !DILocation(line: 542, column: 5, scope: !879)
!972 = !DILocation(line: 0, scope: !755)
!973 = !DILocation(line: 413, column: 13, scope: !246, inlinedAt: !974)
!974 = distinct !DILocation(line: 439, column: 20, scope: !541, inlinedAt: !975)
!975 = distinct !DILocation(line: 543, column: 5, scope: !668)
!976 = !DILocation(line: 0, scope: !541, inlinedAt: !975)
!977 = !DILocation(line: 0, scope: !239, inlinedAt: !974)
!978 = !DILocation(line: 413, column: 8, scope: !239, inlinedAt: !974)
!979 = !DILocation(line: 414, column: 28, scope: !249, inlinedAt: !974)
!980 = !DILocation(line: 415, column: 28, scope: !251, inlinedAt: !974)
!981 = !DILocation(line: 416, column: 28, scope: !253, inlinedAt: !974)
!982 = !DILocation(line: 417, column: 28, scope: !255, inlinedAt: !974)
!983 = !DILocation(line: 418, column: 28, scope: !257, inlinedAt: !974)
!984 = !DILocation(line: 419, column: 28, scope: !259, inlinedAt: !974)
!985 = !DILocation(line: 420, column: 28, scope: !261, inlinedAt: !974)
!986 = !DILocation(line: 421, column: 28, scope: !263, inlinedAt: !974)
!987 = !DILocation(line: 422, column: 28, scope: !265, inlinedAt: !974)
!988 = !DILocation(line: 423, column: 29, scope: !267, inlinedAt: !974)
!989 = !DILocation(line: 424, column: 29, scope: !269, inlinedAt: !974)
!990 = !DILocation(line: 0, scope: !271, inlinedAt: !974)
!991 = !DILocation(line: 0, scope: !246, inlinedAt: !974)
!992 = !DILocation(line: 441, column: 8, scope: !563, inlinedAt: !975)
!993 = !DILocation(line: 441, column: 23, scope: !563, inlinedAt: !975)
!994 = !DILocation(line: 0, scope: !563, inlinedAt: !975)
!995 = !DILocation(line: 441, column: 8, scope: !541, inlinedAt: !975)
!996 = !DILocation(line: 446, column: 5, scope: !567, inlinedAt: !975)
!997 = !DILocation(line: 443, column: 22, scope: !567, inlinedAt: !975)
!998 = !DILocation(line: 447, column: 22, scope: !571, inlinedAt: !975)
!999 = !DILocation(line: 448, column: 16, scope: !571, inlinedAt: !975)
!1000 = !DILocation(line: 448, column: 22, scope: !571, inlinedAt: !975)
!1001 = !DILocation(line: 449, column: 25, scope: !571, inlinedAt: !975)
!1002 = !DILocation(line: 449, column: 31, scope: !571, inlinedAt: !975)
!1003 = !DILocation(line: 544, column: 5, scope: !668)
!1004 = distinct !DISubprogram(name: "mm_realloc", scope: !3, file: !3, line: 889, type: !1005, scopeLine: 889, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1007)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!12, !12, !41}
!1007 = !{!1008, !1009, !1010, !1011, !1012}
!1008 = !DILocalVariable(name: "ptr", arg: 1, scope: !1004, file: !3, line: 889, type: !12)
!1009 = !DILocalVariable(name: "size", arg: 2, scope: !1004, file: !3, line: 889, type: !41)
!1010 = !DILocalVariable(name: "block", scope: !1004, file: !3, line: 890, type: !13)
!1011 = !DILocalVariable(name: "copysize", scope: !1004, file: !3, line: 891, type: !41)
!1012 = !DILocalVariable(name: "newptr", scope: !1004, file: !3, line: 892, type: !12)
!1013 = !DILocation(line: 0, scope: !1004)
!1014 = !DILocation(line: 0, scope: !115, inlinedAt: !1015)
!1015 = distinct !DILocation(line: 890, column: 22, scope: !1004)
!1016 = !DILocation(line: 242, column: 35, scope: !115, inlinedAt: !1015)
!1017 = !DILocation(line: 242, column: 12, scope: !115, inlinedAt: !1015)
!1018 = !DILocation(line: 895, column: 14, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1004, file: !3, line: 895, column: 9)
!1020 = !DILocation(line: 895, column: 9, scope: !1004)
!1021 = !DILocation(line: 0, scope: !632, inlinedAt: !1022)
!1022 = distinct !DILocation(line: 896, column: 9, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1019, file: !3, line: 895, column: 20)
!1024 = !DILocation(line: 863, column: 9, scope: !632, inlinedAt: !1022)
!1025 = !DILocation(line: 0, scope: !115, inlinedAt: !1026)
!1026 = distinct !DILocation(line: 866, column: 22, scope: !632, inlinedAt: !1022)
!1027 = !DILocation(line: 867, column: 19, scope: !632, inlinedAt: !1022)
!1028 = !DILocation(line: 0, scope: !295, inlinedAt: !1029)
!1029 = distinct !DILocation(line: 867, column: 19, scope: !632, inlinedAt: !1022)
!1030 = !DILocation(line: 0, scope: !302, inlinedAt: !1031)
!1031 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !1029)
!1032 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !1031)
!1033 = !DILocation(line: 0, scope: !124, inlinedAt: !1034)
!1034 = distinct !DILocation(line: 873, column: 5, scope: !632, inlinedAt: !1022)
!1035 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !1034)
!1036 = !DILocation(line: 0, scope: !138, inlinedAt: !1037)
!1037 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !1034)
!1038 = !DILocation(line: 0, scope: !295, inlinedAt: !1039)
!1039 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !1037)
!1040 = !DILocation(line: 0, scope: !302, inlinedAt: !1041)
!1041 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !1039)
!1042 = !DILocation(line: 901, column: 9, scope: !1004)
!1043 = !DILocation(line: 909, column: 16, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1004, file: !3, line: 909, column: 9)
!1045 = !DILocation(line: 909, column: 9, scope: !1004)
!1046 = !DILocation(line: 914, column: 16, scope: !1004)
!1047 = !DILocalVariable(name: "block", arg: 1, scope: !1048, file: !3, line: 299, type: !13)
!1048 = distinct !DISubprogram(name: "get_payload_size", scope: !3, file: !3, line: 299, type: !296, scopeLine: 299, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1049)
!1049 = !{!1047, !1050}
!1050 = !DILocalVariable(name: "asize", scope: !1048, file: !3, line: 300, type: !41)
!1051 = !DILocation(line: 0, scope: !1048, inlinedAt: !1052)
!1052 = distinct !DILocation(line: 914, column: 16, scope: !1004)
!1053 = !DILocation(line: 301, column: 18, scope: !1048, inlinedAt: !1052)
!1054 = !DILocation(line: 915, column: 14, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1004, file: !3, line: 915, column: 9)
!1056 = !DILocation(line: 915, column: 9, scope: !1004)
!1057 = !DILocation(line: 918, column: 5, scope: !1004)
!1058 = !DILocation(line: 0, scope: !632, inlinedAt: !1059)
!1059 = distinct !DILocation(line: 921, column: 5, scope: !1004)
!1060 = !DILocation(line: 0, scope: !115, inlinedAt: !1061)
!1061 = distinct !DILocation(line: 866, column: 22, scope: !632, inlinedAt: !1059)
!1062 = !DILocation(line: 867, column: 19, scope: !632, inlinedAt: !1059)
!1063 = !DILocation(line: 0, scope: !295, inlinedAt: !1064)
!1064 = distinct !DILocation(line: 867, column: 19, scope: !632, inlinedAt: !1059)
!1065 = !DILocation(line: 0, scope: !302, inlinedAt: !1066)
!1066 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !1064)
!1067 = !DILocation(line: 223, column: 18, scope: !302, inlinedAt: !1066)
!1068 = !DILocation(line: 0, scope: !124, inlinedAt: !1069)
!1069 = distinct !DILocation(line: 873, column: 5, scope: !632, inlinedAt: !1059)
!1070 = !DILocation(line: 353, column: 19, scope: !124, inlinedAt: !1069)
!1071 = !DILocation(line: 0, scope: !138, inlinedAt: !1072)
!1072 = distinct !DILocation(line: 354, column: 23, scope: !124, inlinedAt: !1069)
!1073 = !DILocation(line: 0, scope: !295, inlinedAt: !1074)
!1074 = distinct !DILocation(line: 267, column: 40, scope: !138, inlinedAt: !1072)
!1075 = !DILocation(line: 0, scope: !302, inlinedAt: !1076)
!1076 = distinct !DILocation(line: 232, column: 12, scope: !295, inlinedAt: !1074)
!1077 = !DILocation(line: 923, column: 5, scope: !1004)
!1078 = !DILocation(line: 924, column: 1, scope: !1004)
!1079 = !DISubprogram(name: "mem_memcpy", scope: !163, file: !163, line: 113, type: !1080, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !166)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!12, !12, !1082, !41}
!1082 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1083, size: 64)
!1083 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1084 = distinct !DISubprogram(name: "mm_calloc", scope: !3, file: !3, line: 934, type: !1085, scopeLine: 934, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1087)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!12, !41, !41}
!1087 = !{!1088, !1089, !1090, !1091}
!1088 = !DILocalVariable(name: "elements", arg: 1, scope: !1084, file: !3, line: 934, type: !41)
!1089 = !DILocalVariable(name: "size", arg: 2, scope: !1084, file: !3, line: 934, type: !41)
!1090 = !DILocalVariable(name: "bp", scope: !1084, file: !3, line: 935, type: !12)
!1091 = !DILocalVariable(name: "asize", scope: !1084, file: !3, line: 936, type: !41)
!1092 = !DILocation(line: 0, scope: !1084)
!1093 = !DILocation(line: 936, column: 29, scope: !1084)
!1094 = !DILocation(line: 938, column: 18, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1084, file: !3, line: 938, column: 9)
!1096 = !DILocation(line: 938, column: 9, scope: !1084)
!1097 = !DILocation(line: 941, column: 9, scope: !1084)
!1098 = !DILocation(line: 946, column: 10, scope: !1084)
!1099 = !DILocation(line: 947, column: 12, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1084, file: !3, line: 947, column: 9)
!1101 = !DILocation(line: 947, column: 9, scope: !1084)
!1102 = !DILocation(line: 952, column: 5, scope: !1084)
!1103 = !DILocation(line: 954, column: 5, scope: !1084)
!1104 = !DILocation(line: 955, column: 1, scope: !1084)
!1105 = !DISubprogram(name: "mem_memset", scope: !163, file: !163, line: 122, type: !1106, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !166)
!1106 = !DISubroutineType(types: !1107)
!1107 = !{!12, !12, !69, !41}
