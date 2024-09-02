import 'package:rep_p_mobile/src/common/funcoes_globais.dart';
import 'package:rep_p_mobile/src/model/marcacao.dart';
import 'package:rep_p_mobile/src/service/registrar_marcacao.dart';

class MarcacaoRepository {
  Future<void> registrarMarcacao() async {
    try {
      await MarcacaoApi().marcacaoToken();
    } catch (e) {
      print('Erro ao adicionar despesa: $e');
    }
  }

  Future<List<GetMarcacoesModel>> getMarcacoes(String cpf) async {
    try {
      return await MarcacaoApi().buscarMarcacoesDia(cpf);
    } catch (e) {
      print('Erro ao buscar marcações: $e');
      throw Exception('Erro ao buscar marcações');
    }
  }

    Future<List<GetMarcacoesModel>> getMarcacoesPeriodo(String dataIni, dataFim, cpf) async {
    try {
        dataIni = FuncoesGlobais.formatarDataYYYYMMDD(dataIni);
        dataFim = FuncoesGlobais.formatarDataYYYYMMDD(dataFim);
        print('Data inicio: $dataIni');
        print('Data fim: $dataFim');
      return await MarcacaoApi().buscarMarcacoesPorPeriodo(dataIni, dataFim, cpf);
    } catch (e) {
      print('Erro ao buscar marcações: $e');
      throw Exception('Erro ao buscar marcações');
    }
  }
}
