require "rails_helper"

describe ApiClient::Nominatim, :vcr do
  let(:client) { described_class.new }

  describe "#search" do
    it "return array" do
      search = client.search(q: "Alexandria")

      expect(search).to eq(
        [{ "place_id" => "222832679",
           "boundingbox" => [38.7844847, 38.845011, -77.144359, -77.0370392],
           "polygonpoints" => <<~DOC.delete("\n"),
             wc{kFfgzuMdC_@zJ_B`BUtCc@hAQjDg@kAwAKeApFmBrMoExCcAhE{Al@SsBeLhOe@uAeROoBu@kJo@oI}@sLa@{FWeD_AqM}@_MUqBk@_Fs@eFu@sEs@oDu@eDWaAYkAuA_Fe@{A]_A_@gA`BcACOdBg@_C{QaBmQ[mGKcFMcIByHRyGtBuc@dJ{b
             B|BaS`C{NrAsGxAqG~AuFjJa]dJmF^kK`HoKhBmEnBmEbCaKzF{KhI_TlDmE`Rgi@cc@g@[aEgESm@gAyw@r@oS}CsMuAsKeAqEg@mDi@mKc@oM`@cAd@yA`Bo@h@{D~@mEf@iEv@y@PgAU]B_B`CyAjAoBOo@q@gBH]|@UdAWz@wAx@oB\\c@Iq@m@c@cAk@oBw@u
             Cs@q@uASuAUeCWgBUwAEwC_@sCi@mC]qBSuAJy@Fe@NwAXiAlAuBnBcAtAkAbCqApCuBbEGf@Fb@`@t@PJ\\D`AMxAm@jBs@zAYh@\\ZrBDPMr@qFlBmCz@e@^w@dAkFfBeE`A}FTeDTuA@gALkA|AoAx@{@?mAyAoBpDDtAAt@wBr@BvDG~AIz@KjAOfAEVG\\A\\
             Hj@Nd@nDlFPj@Fr@D|@AzAG`AqHjUi@hBaAtCe@~AwA`Dm@|Ai@dAs@dBw@xAw@jBcA~BWn@Ml@M~@Cx@HrAEFNhABRFXtAbDd@dCXzAb@bFEjBC`@OpAUfCQjAQ~BL|@DrAJlDFtBFxBJlDRfHLfCAtAVzCHv@TxBLhAdArHgDd^tAHvAAvBOjG_Ad@EtIeApAe@r
             BIZCr@DnBBlAD|@DxAH`B\\d@Lp@Tj@Tt@Nd@DjBC`CCbB?rAC~AC|ACf@?d@AR?R@l@BL@n@J\\Jb@Nj@TTJXNb@Np@X`@Rz@`@ERb@VtAhAf@h@|@xATl@Lf@_JtMaEzFeB~B}AvBgClDuAlBi@v@oAfBi@t@kA`ByBhDeAnBaCzEa@fAeBvDyBdFcBiA@C@KAG?
             GAECGCE?AEEGACAEAC?C?C@E@GDCB?BCDABAJ?JBPBJcBnC{CfFmAv@q@Xa@JUDg@AgBdFk@xA}A`C`CbDuFjFA@A?E?A?CCk@oAIBw@TUFcA\\TzALn@FVFf@aBjCoAlCcBpFh@hAzK`j@|EtUcFv@lB`PsB`@hCdFhAiAT`@`C}Af@zCfA_@Z]tCmBbBeA`CxQAr
             @xJvHbJdK~EpV`Dw@zAOJGz@hCZd@tCnEp@~A~DrFxAtC^bAt@tAvAjCX\\NHp@TPHRLHHf@p@PRHHFFNJRFPFPF^JNFh@GfAKTC|DnACkDImPpNqG|@pBvEfG?@tAdBfDaFzApBlFjCc@rANJqAzDdJbGnHbFhCV@?zBBvDFx@@xCDlBFLlB
           DOC
           "lat" => 38.8147596,
           "lon" => -77.0902477,
           "display_name" => "Alexandria, Virginia",
           "type" => "city" }]
      )
    end
  end
end
